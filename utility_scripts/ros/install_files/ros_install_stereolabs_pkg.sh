#!/bin/bash

############## Install Stereolabs ZED ROS Components

sudo apt install -y ros-melodic-tf2-ros ros-melodic-nav-msgs ros-melodic-cpp-common \
                  ros-melodic-sensor-msgs ros-melodic-opencv-apps ros-melodic-image-transport \
                  ros-melodic-dynamic-reconfigure ros-melodic-urdf
cd ~/catkin_ws/src
git clone --recursive https://github.com/stereolabs/zed-ros-wrapper.git
git clone https://github.com/stereolabs/zed-ros-examples.git
sudo rm -rf /zed-ros-examples/tests
echo "------------> Installed Stereolabs ZED ROS Packages Successfully"
echo "------> Example Usage: roslaunch zed_wrapper zed.launch"
echo "---> Rebuilt catkin_ws to utilize"