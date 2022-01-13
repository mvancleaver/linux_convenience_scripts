#!/bin/bash

############## Install IFM o3D ROS Components
#cd ~/catkin_ws/src
#git clone https://github.com/ifm/ifm3d-ros.git
#cd ~/catkin_ws && catkin build

sudo apt-get install -y ros-melodic-ifm3d* 

echo "------------> Installed IFM o3D ROS Packages Successfully"
echo "------> Example Usage: roslaunch ifm3d camera.launch"
echo "---> Rebuilt catkin_ws to utilize"
cd ~/

