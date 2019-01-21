# Debian-based OS fresh install guide

Here we are preparing fresh machine for use.
At first update and upgrade machine:

``` bash
sudo apt update && sudo apt upgrade
```

#### IP Setings

At first, we are configuring IP settings.

##### IPv6 Disableing
To do so open the `/etc/default/grub` using your favorite text editor with root privileges and change/add:

From:
```
GRUB_CMDLINE_LINUX_DEFAULT=""
GRUB_CMDLINE_LINUX=""
```

To:
```
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1"
GRUB_CMDLINE_LINUX="ipv6.disable=1"
```

After that you should update grub:

``` bash
$ sudo update-grub
```

##### IPv4 config
Open the `/etc/gai.conf` on ubuntu server. 
Un-comment the following line starting with `precedence` :

``` python
# For sites which prefer IPv4 connections change the last line to 
# precedence ::ffff:0:0/96 100 
```

#### Dependencies Setup

``` bash
sudo apt install libass-dev libpq-dev postgresql \
    build-essential redis-server redis-tools
```

#### Generate deploy keys on server

Generate RSA keys on deploy server then send public key to be added on repo.

``` bash
sudo su -
cd ~/.ssh
ssh-keygen -f dolphin-deploy_rsa
# Leave passphrase empty by hittin return key
```

now send public key to admin using clipboard or an external file

``` bash
cat ~/.ssh/dolphin-deploy_rsa.pub 
```
