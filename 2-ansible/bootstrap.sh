#!/bin/bash

# chage the apt source to iran
sed -i 's/http:\/\/us./http:\/\/ir./g' /etc/apt/sources.list

sudo apt update
sudo apt install -y sshpass
# sudo apt install -y vim tmux

# Provision to copy manager's SSH key to workers
for i in {1..$1}; do
    sshpass -p vagrant scp -o StrictHostKeyChecking=no /home/vagrant/.ssh/id_rsa.pub \
      vagrant@192.168.56.11$i:/home/vagrant/.ssh/authorized_keys;
done