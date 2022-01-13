#!/bin/bash

############## Install SICK ROS Components
#cd ~/catkin_ws/src
#git clone https://github.com/SICKAG/sick_visionary_t.git
#git clone https://github.com/SICKAG/sick_safetyscanners.git
#git clone https://github.com/SICKAG/sick_ldmrs_laser.git
#git clone https://github.com/SICKAG/sick_scan

sudo apt install -y ros-melodic-sick-*

echo "------------> Installed SICK ROS Packages Successfully"
echo "------> Example Usage: roslaunch sick_visionary_t sick_visionary_t_driver.launch sensor_ip:=XXX.XXX.XXX.XXX host_ip:=XXX.XXX.XXX.XXX"
echo "------> Example Usage: roslaunch sick_safetyscanners sick_safetyscanners.launch sensor_ip:=XXX.XXX.XXX.XXX host_ip:=XXX.XXX.XXX.XXX"
echo "------> Example Usage: roslaunch sick_ldmrs_tools sick_ldmrs_demo.launch sensor_ip:=XXX.XXX.XXX.XXX host_ip:=XXX.XXX.XXX.XXX"
echo "------> Example Usage: roslaunch sick_scan sick_tim_5xx.launch sensor_ip:=XXX.XXX.XXX.XXX host_ip:=XXX.XXX.XXX.XXX"
echo "---> Rebuilt catkin_ws to utilize"
cd ~/

v       