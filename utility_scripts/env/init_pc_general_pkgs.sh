#!/bin/bash

############## General Packages   
echo "------------> Installing Genneral Packages"
sudo apt update
sudo apt install -y byobu build-essential gcc git openssh-server curl arp-scan nano jq gparted
## Enable Byobu
byobu-enable
echo "------------> BYOBU Enabled on login"
## Create Bash Profile
echo "source ~/.bashrc" >> ~/.bash_profile
source ~/.bash_profile
echo "------------> Created ~/.bash_profile"