#!/bin/bash

############## Upgrade CMAKE to Latest
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
sudo apt-add-repository -y 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt update && sudo apt -y install cmake
echo "------------> Installed Latest CMAKE Successfully"



