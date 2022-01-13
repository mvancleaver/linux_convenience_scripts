#!/bin/bash
############## Install LORD MSCL ROS Components
cd ~/catkin_ws/src && git clone https://github.com/LORD-MicroStrain/ROS-MSCL.git
mv ROS-MSCL/ ros_mscl/ 
cd ~/catkin_ws/ && catkin_make --pkg ros_mscl -DCMAKE_BUILD_TYPE=Release
cd ~/ && source ~/catkin_ws/devel/setup.bash
rospack find ros_mscl
cd ~/
# echo "------------> Installed LORD MSCL ROS Packages Successfully"
# echo "------> Example Usage: roslaunch ros_mscl microstrain.launch port:=/dev/ttyUSB0"