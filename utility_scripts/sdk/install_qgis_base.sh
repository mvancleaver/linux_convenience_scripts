#!/bin/bash

############## Install Q-GIS 

arch=$(uname -m)

if [ "$arch" == 'x86_64' ]
then
    echo "x86_64 Architecture"
    sudo apt install -y gnupg software-properties-common
    wget -qO - https://qgis.org/downloads/qgis-2021.gpg.key | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import
    sudo chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg
    sudo add-apt-repository -y "deb https://qgis.org/ubuntu $(lsb_release -c -s) main"
    sudo apt update && sudo apt install -y qgis qgis-plugin-grass qgis-server
    echo "------------> Installed QGIS Successfully"
else
    echo "Architecture Not Support : Please use x86"
    exit 1 
fi
