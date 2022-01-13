#!/bin/bash

############## Install Stereolabs ZED ROS Components

cd ~/catkin_ws/src
git clone https://github.com/ros-drivers/velodyne.git
echo "------------> Installed Stereolabs ZED ROS Packages Successfully"
echo "------> Example Usage: roslaunch zed_wrapper zed2i.launch port:=/dev/ttyXXXX"
echo "---> Rebuilt catkin_ws to utilize"
cd ~/

