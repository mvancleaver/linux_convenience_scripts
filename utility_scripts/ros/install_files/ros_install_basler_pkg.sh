#!/bin/bash

############## Install Basler Pylon ROS Components

cd ~/catkin_ws/src
git clone https://github.com/basler/pylon-ros-camera.git
git clone https://github.com/dragandbot/dragandbot_common.git
sudo sh -c 'echo "yaml https://raw.githubusercontent.com/basler/pylon-ros-camera/master/pylon_camera/rosdep/pylon_sdk.yaml" > /etc/ros/rosdep/sources.list.d/30-pylon_camera.list' 
rosdep update && sudo rosdep install --from-paths . --ignore-src --rosdistro=$ROS_DISTRO -y
echo "------------> Installed Basler Pylon ROS Packages Successfully"
echo "------> Example Usage: roslaunch pylon_camera pylon_camera_node.launch"
echo "------> Example Usage: roslaunch pylon_camera pylon_camera_ip_configuration.launch"
echo "---> Rebuilt catkin_ws to utilize"
cd ~/

