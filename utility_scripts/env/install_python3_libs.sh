#!/bin/bash
############## Python 3 
sudo apt install -y python3 python3-pip python3-dev 
sudo -H pip3 install --upgrade pip
pip3 install future scikit-build cython smbus numpy pyserial python-can
echo "------------> Installed Python 3 Successfully"