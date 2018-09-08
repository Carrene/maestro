#!/usr/bin/env bash


apt update

apt install -y nginx redis-server postgresql git build-essential \
    libncursesw5-dev libreadline6-dev libssl-dev libgdbm-dev \
    libc6-dev iptables-persistent 


useradd -r maestro


# python3.6
apt build-dep python3.5
cd /tmp
wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz
tar -xvf Python-3.6.*.tar.xz
cd Python-3.6.*
./configure
make -j4
make altinstall


mkdir -p /etc/maestro
mkdir -p /var/log/maestro
chown maestro /var/log/maestro


echo "CREATE USER maestro" | sudo -u postgres psql
echo "listen_addresses = ''" >> /etc/postgresql/9.5/main/postgresql.conf
service postgresql restart
