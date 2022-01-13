#!/bin/bash
############## Install Ouster ROS Components
# Depends
sudo apt install -y libglfw3-dev libglew-dev libeigen3-dev libjsoncpp-dev libtclap-dev linuxptp httpie
# PTP Config File
echo "[global]" >> ~/os.conf
echo "ntx_timestamp_timeout 10" >> ~/os.conf
sudo mv ~/os.conf /etc/linuxptp/
# Enable PTP Service 
http PUT http://10.0.0.32/api/v1/time/ptp/profile <<< '"default-relaxed"'
sudo ptp4l -i eth1 /etc/linuxptp/os.conf -S &
# Link ROS Libraries
cd ~/Libraries && git clone https://github.com/ouster-lidar/ouster_example.git
ln -s ~/Libraries/ouster_example ~/catkin_ws/src
cd ~/catkin_ws/ && catkin_make -DCMAKE_BUILD_TYPE=Release
cd ~/ && source ~/catkin_ws/devel/setup.bash
echo "------------> Installed Ouster ROS Packages Successfully"
echo "------> Example Usage: roslaunch ouster_ros ouster.launch sensor_hostname:=10.0.0.32 metadata:=~/.ros/ouster.json"
