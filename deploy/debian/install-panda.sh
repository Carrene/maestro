#!/usr/bin/env bash

# Restart nginx and redis to strat successfully after editing their config
service redis-server restart
service nginx restart

# Clone panda and install it
cd /usr/local/maestro
git clone git@github.com:Carrene/panda.git
if [ $? != 0 ] ; then 
  echo "Can not clone panda. Check this problem"
  exit 1
fi
cd panda
pip3.6 install -e .

# Create required directories and files:
echo "
db:
  url: postgresql://maestro:@/panda

reset_password:
  secret: !!binary xxSN/uarj5SpcEphAHhmsab8Ql2Og/2IcieNfQ3PysI=
  max_age: 3600  # seconds
  algorithm: HS256
  callback_url: http://nightly.cas.carrene.com/reset_password

registeration:
  secret: !!binary xxSN/uarj5SpcEphAHhmsab8Ql2Og/2IcieNfQ3PysI=
  max_age: 86400  # seconds
  algorithm: HS256
  callback_url: http://nightly.cas.carrene.com/signup

messaging:
  default_messenger: restfulpy.messaging.SmtpProvider
  template_dirs:
    - %(root_path)s/panda/email_templates

smtp:
  host: smtp.gmail.com
  port: 587
  username: cas@carrene.com
  password: V3NxJF4abPNUvkAV
  local_hostname: carrene.com

sms:
  provider: panda.sms.AutomaticSmsProvider
  cm:
    sender: cas@Carrene
    refrence: Carrene
    token: D3774402-61F0-4929-ABCA-956B8B4C88EF
    url: https://gw.cmtelecom.com/v1.0/message
  kavenegar:
    apiKey: 4C59796C3441774D32637879544F2F5356313235667569366E7330302F32374E

phone:
  activation_code:
    length: 6
    hash_algorithm: SHA-1
    time_interval: 59 # seconds
    challenge_limit: 40
    seed: !!python/bytes nrZh/4o5+FsQgws1+Gj1aqp23aGetmH/ijn5iwar4OE=
    window: 4
  jwt:
    max_age: 86400

worker:
  gap: 10

logging:
  loggers:
    default:
      propagate: false

    taskqueue:
      propagate: false

storage:
  local_directory: /var/www/assets/panda
  base_url: http://nightly.cas.carrene.com/assets

jwt:
  refresh_token:
    secure: false
" > /etc/maestro/panda.yml

echo "
import os
from panda import panda


panda.configure(files='/etc/maestro/panda.yml')
panda.initialize_orm()


verbs = [
    'GET',
    'CREATE',
    'DEFINE',
    'LIST',
    'LOGOUT',
    'METADATA',
    'REVOKE',
    'UPDATE',
    'CHECK',
    'CLAIM',
    'REGISTER',
    'INVITE',
    'JOIN',
    'CHANGE',
    'RESET',
    'BIND',
    'ASK',
    'INVALIDATE'
]


http_headers = [
    'X-Pagination-Count',
    'X-Pagination-Take',
    'X-Pagination-Skip',
    'X-Identity',
    'X-New-JWT-Token',
]


def cross_origin_helper_app(environ, start_response):

    def better_start_response(status, headers, *args, **kw):
        headers.append(('Access-Control-Allow-Origin', 'http://nightly.maestro.carrene.com'))
        headers.append(('Access-Control-Allow-Headers', 'Content-Type, Authorization'))
        headers.append(('Access-Control-Allow-Credentials', 'true'))
        headers.append(('Access-Control-Allow-Methods', ', '.join(verbs)))
        headers.append(('Access-Control-Expose-Headers', ', '.join(http_headers)))
        start_response(status, headers, *args, **kw)

    if environ['REQUEST_METHOD'] == 'OPTIONS':
        better_start_response('200 Ok', [])
        return []

    return panda(environ, better_start_response)


app = cross_origin_helper_app
" > /etc/maestro/pandawsgi.py

echo "
[Unit]
Description=CAS Back-end REST API (nightly)
After=network.target
[Service]
PIDFile=/run/maestro/panda.pid
User=maestro
Group=maestro
ExecStart=/usr/local/bin/gunicorn \
	--bind unix:/run/maestro/panda.socket \
	--pid /run/maestro/panda.pid \
	--chdir /etc/maestro \
	pandawsgi:app
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s TERM $MAINPID
PrivateTmp=true
[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/panda.service

echo "
upstream panda_api {
    server unix:/run/maestro/panda.socket fail_timeout=1;
}
server {
    listen 8081 default;
    root /var/www/html;
    index index.html;
    location /apiv1/ {
      proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
      proxy_redirect off;
      proxy_pass http://panda_api;
    }
    location / {
        try_files \$uri \$uri/ =404;
    }
}
" > /etc/nginx/sites-available/panda.conf

ln -s /etc/nginx/sites-available/panda.conf /etc/nginx/sites-enabled/panda.conf
sudo -u maestro panda --config-file /etc/maestro/panda.yml db schema
sudo -u maestro panda --config-file /etc/maestro/panda.yml db basedata 

# Restart services and starting panda
service nginx restart
systemctl enable panda.service
service panda start

