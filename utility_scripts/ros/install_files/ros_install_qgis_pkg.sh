#!/bin/bash

############## Install Q-GIS ROS Components

arch=$(uname -m)

if [ "$arch" == 'x86_64' ]
then
    echo "x86_64 Architecture"
    cd ~/catkin_ws/src
    git clone https://github.com/clearpathrobotics/wireless.git
    git clone https://github.com/locusrobotics/json_transport.git
    git clone https://github.com/locusrobotics/qgis_ros.git
    cd ~/catkin_ws/src/qgis_ros
    pip3 install -r requirements.txt
    echo "------------> Installed QGIS ROS Packages Successfully"
    echo "------> Example Usage: rosrun qgis_ros start_qgis_ros"

else
    echo "Architecture Not Support : Please use x86"
    exit 1 
fi
