# Maestro deployment instruction

###### Sub-applications deployment ordering 

For deploying **Maestro** application, you need to deploy CAS application(back-end and front-end) and Cucumber application(just back-end).

So that, the sub-applications deploying ordering is:

1. CAS
2. Maestro
3. Cucumber


### Before running the scripts

This document is provided to deploy on *Ubuntu 16.04*.

You should have installed **python3.7.1**.

Add `universe` package to `apt` sources, Then:

```bash
sudo apt update
sudo apt dist-upgrade
sudo apt install ssh
```

Install `pip3.6` using this command:

```bash
curl https://bootstrap.pypa.io/get-pip.py| sudo -H python3.7
```

Create `maestro` user and group:

```bash
sudo useradd -r maestro
```

Add your user to maestro group:

```bash
sudo adduser <your-username> maestro
```

Finally **reboot** server.

### Panda nightly:

#### Prerequisite Project

**Panda** project needs **oath.cy**.
**oath.cy** needs Cython, So run following command to install Cython:

```bash

sudo pip3 install cython
```

###### Deploy key for Oath.cy

```bash

ssh-keygen -t rsa -b 4096 -f ~/.ssh/github-oathcy.key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github-oathcy.key
echo "
Host github-oathcy
    User git
    HostName github.com
    IdentityFile ~/.ssh/github-oathcy.key
" >> ~/.ssh/config
```

Then follow [Github instruction](https://developer.github.com/v3/guides/managing-deploy-keys/#setup-2) to add `~/.ssh/github-oathcy.key.pub` to oath.cy's deploy keys.

=============================== you are here ===============================
```bash

```

### Dolphin nightly:

#### Deploy key

```bash

ssh-keygen -t rsa -b 4096 -f ~/.ssh/github-dolphin.key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github-dolphin.key
echo "
Host github-dolphin
    User git
    HostName github.com
    IdentityFile ~/.ssh/github-dolphin.key
" >> ~/.ssh/config
```

Then follow [Github instruction](https://developer.github.com/v3/guides/managing-deploy-keys/#setup-2) to add `~/.ssh/github-dolphin.key.pub` to dolphin's deploy keys.

#### Deploying

Copy this directory on the maestro server and and run:

```bash
./pre-install.sh
```

Then **reboot** server.

And finally, install dolphin-nightly by running `nightly-dolphin.sh` script:

```bash
./nightly-dolphin.sh
```
