#!/bin/bash

############## Install Cartographer Mapping ROS Packages
echo "------------> Installing Cartographer"
sudo apt-get update
sudo apt install -y ros-melodic-costmap-2d ros-melodic-cartographer*
echo "------------> Successfully Installed Cartographer from Apt"

## Ouster Demo repo 
#git clone https://github.com/Miro001/Ouster-cartographer.git

## Build From Source 
#sudo apt-get update
#sudo apt-get install -y python-wstool python-rosdep ninja-build stow ros-melodic-costmap-2d
#cd ~/catkin_ws/src
#wstool init src
#wstool merge -t src https://raw.githubusercontent.com/cartographer-project/cartographer_ros/master/cartographer_ros.rosinstall
#wstool update -t src
#rosdep update
#rosdep install --from-paths src --ignore-src -r -y
#src/cartographer/scripts/install_abseil.sh
#sudo apt-get remove ros-melodic-abseil-cpp -y
#catkin_make_isolated --install --use-ninja
#source ~/catkin_ws/devel/setup.bash
#echo "------------> Successfully Built catkin_ws"
#cd ~/