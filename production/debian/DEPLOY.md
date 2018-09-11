
# Alpha deployment instruction

### Before running the scripts

You should have installed **python3.6**.

Add `universe` package to `apt` sources, Then:

```bash
sudo apt update
sudo apt dist-upgrade
sudo apt install ssh python3-distutils
```

Install `pip3.6` using this command:

```bash
curl https://bootstrap.pypa.io/get-pip.py| sudo -H python3.6
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

