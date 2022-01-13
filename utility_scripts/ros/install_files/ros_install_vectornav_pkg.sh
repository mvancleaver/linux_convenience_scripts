#!/bin/bash

############## Install Velodyne ROS Components
cd ~/catkin_ws/src
git clone https://github.com/dawonn/vectornav.git
echo "------------> Installed Velodyne ROS Packages Successfully"
echo "------> Example Usage: roslaunch velodyne_pointcloud 32e_points.launch calibration:=/home/user/32db.yaml"
echo "---> Rebuilt catkin_ws to utilize"
cd ~/

