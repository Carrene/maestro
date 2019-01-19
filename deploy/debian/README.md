# Debian fresh install guide
here we are preparing fresh machine for use.
#### IP Setings
At first, we are configuring IP settings.

##### IPv6 Disableing
Add the following line in ` /etc/sysctl.conf` :
``` bash
net.ipv6.conf.all.disable_ipv6 = 1 
net.ipv6.conf.default.disable_ipv6 = 1 
net.ipv6.conf.lo.disable_ipv6 = 1 
```
##### IPv4 config
Open the `/etc/gai.conf` on ubuntu server. 
Un-comment the following line starting with `precedence` :

``` python
# For sites which prefer IPv4 connections change the last line to 
# precedence ::ffff:0:0/96 100 
```


