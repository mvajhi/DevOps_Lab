#!/bin/bash

# chage the apt source to iran
sed -i 's/http:\/\/us./http:\/\/ir./g' /etc/apt/sources.list

# sudo apt update
# sudo apt install -y vim tmux