#!/bin/bash
############## Install RTAB Map ROS Components
#git clone https://github.com/introlab/rtabmap_ros
#sudo apt install ros-melodic-rtabmap* -y
# Build RTAB Map ROS Package 
cd ~/catkin_ws/src
git clone https://github.com/BrutusTT/vision_opencv.git
git clone https://github.com/ros-perception/image_transport_plugins
cd ~/catkin_ws/ && catkin_make -j4 -DCMAKE_BUILD_TYPE=Release

source ~/.bashrc && source ~/catkin_ws/devel/setup.bash
cd ~/catkin_ws/src && git clone https://github.com/introlab/rtabmap_ros.git
cd ~/catkin_ws/ && catkin_make -j4 -DCMAKE_BUILD_TYPE=Release -DRTABMAP_SYNC_MULTI_RGBD=ON -DRTABMAP_SYNC_USER_DATA=ON
cd ~/ && source ~/catkin_ws/devel/setup.bash
echo "------------> Installed RTAB Map ROS Package Successfully"

#cd ~/catkin_ws/ && catkin_make -j4 -DCMAKE_BUILD_TYPE=Release -DRTABMAP_SYNC_MULTI_RGBD=ON -DRTABMAP_SYNC_USER_DATA=ON