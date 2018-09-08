# Maestro Installation instruction

Note: all commands in this file should be issued by the sudoer user.

To do that:

```bash
sudo adduser $USER sudo
```

### Before running the scripts

Uncomment these lines to enable some source apt repo in
`/etc/apt/sources.list`

```
deb-src http://archive.ubuntu.com/ubuntu/ xenial main restricted
deb-src http://archive.ubuntu.com/ubuntu/ xenial-updates main restricted
```

#### IPv4
Open `/etc/gai.conf`

Uncomment the following line:

``` bash
#
# For sites which prefer IPv4 connections change the last line to
# precedence ::ffff:0:0/96 100
```

And run the following command:

``` bash
echo 'Acquire::ForceIPv4 "true";' | sudo tee /etc/apt/apt.conf.d/99force-ipv4
```

```bash
apt update
apt dist-upgrade
```

### Time

```
dpkg-reconfigure tzdata
```

Select Asia/Tehran

### Dolphin:


```bash
sudo adduser $USER sudo
```

#### Deploy key

Insert your email in the next line, then enter a pass phrase for the key twice. 

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f ~/.ssh/nigthly-dolphin
```

Start the ssh-agent in the background.

```bash
eval "$(ssh-agent -s)"
```

Add your SSH private key to the ssh-agent:

```bash
ssh-add ~/.ssh/nightly-dolphin
```

Then follow [Github instruction](https://developer.github.com/v3/guides/managing-deploy-keys/#setup-2) to add `~/.ssh/nightly-dolphin.pub` content to dolphin's deploy keys. 



#### Deploying

Copy this directory on the maestro server and login to it as the root:

```
./pre-install.sh
./nightly-dolphin.sh
```

