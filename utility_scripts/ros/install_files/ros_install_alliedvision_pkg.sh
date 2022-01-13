#!/bin/bash

############## Install Allied Vision ROS Components

cd ~/catkin_ws/src && git clone https://github.com/astuff/avt_vimba_camera.git
cd ~/catkin_ws && catkin build
echo "------------> Installed Allied Vision ROS Packages Successfully"
echo "------> Example Usage: roslaunch avt_vimba_camera mono_camera.launch ip:=XXX.XXX.XXX.XXX"
echo "---> Rebuilt catkin_ws to utilize"
cd ~/

