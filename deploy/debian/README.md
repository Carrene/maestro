# Debian-based OS fresh install guide

Here we are preparing fresh machine for use.  
At first update and upgrade machine:

``` bash
apt update 
apt upgrade
```

#### Network configuration

At first, we are configuring IP settings.

##### IPv6 Disableing
To do so open the `/etc/default/grub` using your favorite text editor with  
root privileges and change/add:

From:
```
GRUB_CMDLINE_LINUX_DEFAULT=""
```

To:
```
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1"
```

Now update grub and then reboot:

``` bash
update-grub
reboot
```

##### IPv4 config
Open the `/etc/gai.conf` on ubuntu server.  
Uncomment the following line starting with `precedence`:

```
# precedence ::ffff:0:0/96 100 
```

#### Apt dependencies

``` bash
apt install libass-dev libpq-dev postgresql build-essential redis-server \
redis-tools
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
