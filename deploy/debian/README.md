# Debian-based OS fresh install guide
Here we are preparing fresh machine for use.

#### IP Setings
At first, we are configuring IP settings.

##### IPv6 Disableing
Add the following line in ` /etc/sysctl.conf` :

``` bash
net.ipv6.conf.all.disable_ipv6 = 1 
net.ipv6.conf.default.disable_ipv6 = 1 
net.ipv6.conf.lo.disable_ipv6 = 1 
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
Open the `/etc/gai.conf` on ubuntu server. 
Un-comment the following line starting with `precedence` :

``` python
# For sites which prefer IPv4 connections change the last line to 
# precedence ::ffff:0:0/96 100 
```


