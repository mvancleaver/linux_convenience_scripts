#!/bin/bash

############## Install Bosch Bno055 ROS Components
sudo apt-get -y install ros-melodic-rviz-imu-plugin

cd ~/catkin_ws/src
# i2c Driver 
git clone https://github.com/dheera/ros-imu-bno055.git
# uart Driver 
git clone https://github.com/mdrwiega/bosch_imu_driver.git

echo "------------> Installed Bosch Bno055 ROS Packages Successfully"
echo "------> Example Usage: roslaunch ros-imu-bno055 imu.launch device:=/dev/i2c-XXX"
echo "------> Example Usage: roslaunch bosch_imu_driver imu.launch port:=/dev/ttyXXXX"
echo "---> Rebuilt catkin_ws to utilize"
cd ~/

