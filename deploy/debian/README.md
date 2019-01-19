# Fresh Debian based OS install guide

Here we are preparing fresh machine for use.  
At first update and upgrade machine:

``` bash
apt update 
apt upgrade
```

#### Network configuration

At first, configure network.

##### IPv6 Disableing
Open the `/etc/default/grub` and change/add:

From:
```
GRUB_CMDLINE_LINUX_DEFAULT=""
```

To:
```
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1"
```

Now update grub and reboot:

``` bash
update-grub
reboot
```

##### IPv4 config
Open the `/etc/gai.conf`.  
Uncomment the following line starting with `precedence`:

```
# precedence ::ffff:0:0/96 100 
```

#### Apt dependencies

``` bash
apt install -y libass-dev libpq-dev postgresql build-essential redis-server \
redis-tools
```

#### Clone panda and install with pip

Ensure the `python3.6` and `pip3.6` commands are available and working:

```bash
pip3.6 --version
python3.6 --version
```

Then:

``` bash
mkdir -p /usr/local/maestro 
cd /usr/local/maestro
git clone <panda-git-url>
cd panda
pip3.6 install -e .
```

#### Setup panda

Create required directory and files:

``` bash
touch /etc/maestro/panda.yml
touch /etc/maestro/pandawsgi.py
```

Fill `/etc/maestro/panda.yml` with:

``` yaml
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
```

and `/etc/maestro/pandawsgi.py` with:

``` python
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
```
#### Clone project and install dolphin with pip

Ensure the `python3.6` and `pip3.6` commands are available and working:

```bash
pip3.6 --version
python3.6 --version
```

Then:

``` bash
mkdir /usr/local/maestro 
cd /usr/local/maestro
git clone <dolphin-git-url>
pip3.6 install -e .
```
>>>>>>> corrected IPv6 method using only GRUB

