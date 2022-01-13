#!/bin/bash
############## Install ETH Zurich Elevation Mapping ROS Packages
cd ~/catkin_ws/src && git clone https://github.com/ANYbotics/elevation_mapping.git
cd ~/catkin_ws/ && catkin_make -j6 --pkg elevation_mapping -DCMAKE_BUILD_TYPE=Release
cd ~/ && source ~/catkin_ws/devel/setup.bash
echo "------------> Installed Elevation Mapping ROS Package Successfully"