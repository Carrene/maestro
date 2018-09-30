#!/usr/bin/env bash

set -e

git clone --single-branch --branch nightly \
	git@github-dolphin:Carrene/dolphin.git \
	/usr/local/maestro/dolphin

sudo -H pip3.6 install -e /usr/local/maestro/dolphin


echo "
db:
  url: postgresql://maestro:@/dolphin

logging:

  handlers:
    main:
      filename: /var/log/maestro/dolphin.log
      
    error:
      filename: /var/log/maestro/dolphin-error.log
    
    worker:
      filename: /var/log/maestro/dolphin-worker.log
    
  loggers:
    worker:
      level: info
" | sudo tee /etc/maestro/dolphin.yml > /dev/null


echo "CREATE DATABASE dolphin OWNER maestro" | sudo -u postgres psql


sudo -u maestro dolphin --config-file /etc/maestro/dolphin.yml db schema 


echo "
	d /run/maestro 0755 maestro maestro -
" | sudo tee /usr/lib/tmpfiles.d/dolphin.conf > /dev/null


echo "
import os
from dolphin import dolphin
dolphin.configure(files='/etc/maestro/dolphin.yml')
dolphin.initialize_orm()
app = dolphin
" | sudo tee  /etc/maestro/dolphinwsgi.py > /dev/null

echo "
[Unit]
Description=Maestro Back-end REST API (nightly)
After=network.target
[Service]
PIDFile=/run/maestro/dolphin.pid
User=maestro
Group=maestro
ExecStart=/usr/local/bin/gunicorn --workers 2 \
	--bind unix:/run/maestro/dolphin.socket \
	--pid /run/maestro/dolphin.pid \
	--chdir /etc/maestro \
	dolphinwsgi:app
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s TERM $MAINPID
PrivateTmp=true
[Install]
WantedBy=multi-user.target
" | sudo tee /etc/systemd/system/dolphin.service > /dev/null

sudo systemd-tmpfiles --create
sudo systemctl daemon-reload 
sudo systemctl enable dolphin.service 
sudo service dolphin start 

sudo rm /etc/nginx/sites-enabled/default

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
" | sudo tee /etc/nginx/sites-available/dolphin.conf > /dev/null

sudo ln -s /etc/nginx/sites-available/dolphin.conf /etc/nginx/sites-enabled/

sudo service nginx restart
