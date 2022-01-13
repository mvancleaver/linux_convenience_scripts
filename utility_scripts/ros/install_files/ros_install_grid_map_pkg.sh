#!/bin/bash
############## Install ETH Zurich Grid Map ROS Components
sudo apt-get install -y libeigen3-dev ros-melodic-grid-map
#cd ~/catkin_ws/src && git clone https://github.com/anybotics/grid_map.git
#cd ~/catkin_ws/ && catkin_make -j6 --pkg grid_map -DCMAKE_BUILD_TYPE=Release
#cd ~/ && source ~/catkin_ws/devel/setup.bash
echo "------------> Installed Grid Map ROS Packages Successfully"
echo "------> Example Usage: roslaunch grid_map_demos simple_demo.launch"