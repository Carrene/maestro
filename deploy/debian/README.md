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

At this time, the above method may not work! So recommend method to disable IPv6 on Ubuntu 18.04 after reboot is to configure the GRUB boot loader to pass kernel parameter during the boot time.
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

After that you should update grub using command:

``` bash
$ sudo update-grub
```

##### IPv4 config
Open the `/etc/gai.conf`.  
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

