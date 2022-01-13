#!/bin/bash

cd ~/catkin_ws/src
git clone https://github.com/neomanic/odrive_ros.git
echo "------------> Installed Odrive ROS Packages Successfully"
echo "------> Example Usage: roslaunch odrive_ros odrive.launch"
echo "---> Rebuild catkin_ws to utilize"