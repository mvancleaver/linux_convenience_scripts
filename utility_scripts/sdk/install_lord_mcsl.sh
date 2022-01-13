#!/bin/bash
############## LORD IMU MCSL
cd /home/user/Libraries/
arch=$(uname -m)
if [ "$arch" == 'x86_64' ]
then
    echo "x86_64 Architecture Detected"
    wget https://github.com/LORD-MicroStrain/MSCL/releases/download/v62.0.0/python3-mscl_62.0.0_amd64.deb
    wget https://github.com/LORD-MicroStrain/MSCL/releases/download/v62.0.0/c++-mscl_62.0.0_amd64.deb
    sudo dpkg -i *mscl_62.0.0_amd64.deb
    sudo apt install -f -y  
    sudo mkdir /usr/lib/python3/dist-packages/mscl/
    sudo cp /usr/share/python3-mscl/mscl.py /usr/lib/python3/dist-packages/mscl/
    sudo cp /usr/share/python3-mscl/_mscl.so /usr/lib/python3/dist-packages/mscl/
    cd ~/
    echo "------------> Installed x86 Lord MSCL Drivers Successfully"
elif [ "$arch" == 'aarch64' ]
then 
    echo "aarch64 Architecture Detected"
    wget https://github.com/LORD-MicroStrain/MSCL/releases/download/v62.0.0/python3-mscl_62.0.0_arm64.deb
    wget https://github.com/LORD-MicroStrain/MSCL/releases/download/v62.0.0/c++-mscl_62.0.0_arm64.deb
    sudo dpkg -i *mscl_62.0.0*
    sudo apt install -f -y
    sudo mkdir /usr/lib/python3/dist-packages/mscl/
    sudo cp /usr/share/python3-mscl/mscl.py /usr/lib/python3/dist-packages/mscl/
    sudo cp /usr/share/python3-mscl/_mscl.so /usr/lib/python3/dist-packages/mscl/
    cd ~/
    echo "------------> Installed ARM64 Lord MSCL Drivers Successfully"
else
    echo "Architechture Not Supported"
    exit 1
fi