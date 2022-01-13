#!/bin/bash

############## Install Intel Realsense ROS Components
#sudo apt install -y ros-melodic-vision-opencv ros-melodic-cv*
#cd ~/catkin_ws/src
#git clone https://github.com/IntelRealSense/realsense-ros.git
#cd realsense-ros/
#git checkout `git tag | sort -V | grep -P "^2.\d+\.\d+" | tail -1`

sudo apt update && sudo apt install -y ros-melodic-realsense2-*

echo "------------> Installed Intel Realsense ROS Packages Successfully"
echo "------> Launch Command: roslaunch realsense2_camera rs_camera.launch port:=/dev/ttyXXXX"
echo "---> Rebuilt catkin_ws to utilize"
cd ~/