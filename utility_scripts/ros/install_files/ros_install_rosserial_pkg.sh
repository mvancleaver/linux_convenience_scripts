#!/bin/bash

############## Install ROS Serial Components
#cd ~/catkin_ws/src
#git clone https://github.com/ros-drivers/rosserial.git

sudo apt-get install -y ros-melodic-rosserial*

echo "------------> Installed ROS Serial Packages Successfully"
echo "------> Launch Command: rosrun rosserial_python serial_node.py /dev/ttyXXX "
echo "---> Rebuilt catkin_ws to utilize"
