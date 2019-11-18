#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/28526/add-a-user-to-the-system-only-if-it-doesnt-exist
# https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-centos-quickstart
id -u challenge >/dev/null 2>&1 || useradd challenge
passwd -d challenge
usermod -aG wheel challenge

# yum update -y
sudo yum install -y epel-release
yum install -y nmon

if ! [ -L /var/www ]; then
    rm -rf /var/www
    ln -fs /vagrant /var/www
fi