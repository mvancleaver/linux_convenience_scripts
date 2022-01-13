#!/bin/bash
############## Install ETH Zurich Kinematics / Dynamics ROS Packages
cd ~/catkin_ws/src && git clone https://github.com/ANYbotics/kindr_ros.git
cd ~/catkin_ws/ && catkin_make -j6 --pkg kindr_ros -DCMAKE_BUILD_TYPE=Release
cd ~/ && source ~/catkin_ws/devel/setup.bash
echo "------------> Installed Kinematics / Dynamics ROS Package Successfully"