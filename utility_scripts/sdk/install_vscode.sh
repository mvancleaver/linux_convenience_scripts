#!/bin/bash

############## VS Code Install
sudo apt update && sudo apt install -y software-properties-common apt-transport-https wget
cd /home/user/Libraries/
if [ "$arch" == 'x86_64' ]; then
    echo "x86-64bit Architecture Detected"
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt-get update && sudo apt-get install -y code
    echo "------------> Installed VS Code Successfully"

elif [ "$arch" == 'aarch64' ]; then 
    echo "ARM-64bit Architecture Detected"
    
    VERSION=latest
    wget -N -O vscode-linux-deb.arm64.deb https://update.code.visualstudio.com/$VERSION/linux-deb-arm64/stable
    sudo apt install ./vscode-linux-deb.arm64.deb
    echo "------------> Installed VS Code Successfully"
else
    echo "$arch Not Currently Supported"
    exit 1
fi
cd ~/