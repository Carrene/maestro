#!/usr/bin/env bash

mkdir /usr/local/maestro/dolphin

chown :maestro /usr/local/maestro

git clone -b nightly git@github.com:Carrene/dolphin.git /usr/local/maestro/dolphin


pip3.6 install /usr/local/maestro/dolphin


echo "
db:
  url: postgresql://maestro:@/dolphin
logging:
  handlers:
    main:
      filename: /var/log/dolphin/dolphin.log
    error:
      filename: /var/log/dolphin/error.log
" > /etc/maestro/dolphin.yml


echo "CREATE DATABASE dolphin OWNER maestro" | sudo -u postgres psql


sudo -u maestro dolphin --config-file /etc/maestro/dolphin.yml db schema
sudo -u maestro dolphin --config-file /etc/maestro/dolphin.yml db basedata


echo "d /run/maestro/dolphin 0755 maestro maestro -" > /usr/lib/tmpfiles.d/dolphin.conf


echo "
import os
from dolphin import dolphin
dolphin.configure(files='/etc/maestro/dolphin.yml')
dolphin.initialize_models()
app = dolphin
" > /etc/maestro/dolphinwsgi.py

echo "
[Unit]
Description=Nightly dolphin API
After=network.target
[Service]
Environment="DOLPHIN_CONFIG_FILE=/etc/maestro/dolphin.yml"
PIDFile=/run/maestro/dolphin/pid
User=maestro
Group=maestro
ExecStart=/usr/local/bin/gunicorn --workers 2 --bind unix:/run/maestro/dolphin.socket --pid /run/maestro/dolphin/pid --chdir /etc/maestro dolphinwsgi:app
ExecReload=/bin/kill -s HUP \$MAINPID
ExecStop=/bin/kill -s TERM \$MAINPID
PrivateTmp=true
[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/dolphin.service

systemd-tmpfiles --create
systemctl daemon-reload
systemctl enable dolphin.socket
systemctl enable dolphin.service
service dolphin start


rm /etc/nginx/sites-enabled/default
echo "
upstream dolphin_api {
    server unix:/run/maestro/dolphin.socket fail_timeout=1;
}
server {
    listen 80 default;
    root /var/www/html;
    index index.html;
    location /apiv1/ {
      proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
      proxy_redirect off;
      proxy_pass http://dolphin_api;
    }
    location / {
        try_files \$uri \$uri/ =404;
    }
}
" > /etc/nginx/sites-available/dolphin
ln -s /etc/nginx/sites-available/dolphin /etc/nginx/sites-enabled/
service nginx restart
