#!/usr/bin/env bash

set -e

sudo apt update

sudo -H apt install -y nginx redis-server postgresql git build-essential \
    libpq-dev iptables-persistent python3-dev

sudo -H pip3.6 install pip --upgrade

sudo mkdir -p /etc/maestro
sudo mkdir -p /var/log/maestro
sudo mkdir -p /usr/local/maestro
sudo chown maestro /var/log/maestro
sudo chown -R maestro:maestro /usr/local/maestro
sudo chmod 775 /usr/local/maestro

echo "CREATE USER maestro" | sudo -u postgres psql
echo "listen_addresses = ''" | sudo tee -a \
	/etc/postgresql/9.5/main/postgresql.conf
sudo service postgresql restart

