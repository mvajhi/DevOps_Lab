#!/bin/bash

# change the apt source to iran
sed -i 's/http:\/\/us./http:\/\/ir./g' /etc/apt/sources.list

# set the iptables-persistent to autosave
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections


sudo apt update
sudo apt install -y vim tmux bash-completion iptables-persistent
