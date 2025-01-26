#!/bin/bash

# change the apt source to iran
sed -i 's/http:\/\/us./http:\/\/ir./g' /etc/apt/sources.list

# add my ssh key
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEEZ23Ckrz+7PA7T8+2ps1dcREPui1KABCs8tbpZ6E42 mvajhi@mahdi-laptop" >> ~/.ssh/authorized_keys

sudo apt update
sudo apt install -y vim tmux nginx
