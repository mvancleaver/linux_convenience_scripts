#!/bin/bash
##############  ROS Melodic Install   
sudo apt-get install -y libsdl-image1.2-dev libsdl-dev libgps-dev libmuparser-dev libpcl-dev
pip3 install gnupg msgpack rospkg pycryptodome pycryptodomex catkin_pkg 
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl -y 
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update && sudo apt install -y ros-melodic-desktop
sudo apt install -y ros-melodic-navigation ros-melodic-nav2d ros-melodic-pcl-ros ros-melodic-pcl* \
                    ros-melodic-control* ros-melodic-robot-localization ros-melodic-imu-filter-madgwick \
                    ros-melodic-tf2*
source /opt/ros/melodic/setup.bash
echo "# ROS Params" >> ~/.bashrc
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
echo "------------> Installed ROS Melodic Successfully"
sudo apt install -y python-catkin-tools python-rosdep python-rosinstall python-rosinstall-generator python-wstool python-rosdep python3-empy
sudo rosdep init
rosdep update
source ~/.bashrc
mkdir ~/.ros/bags
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/ && catkin_make -DCMAKE_BUILD_TYPE=Release
cd ~/ && source ~/catkin_ws/devel/setup.bash
echo "export ROS_MASTER_URI=http://127.0.0.1:11311" >> ~/.bashrc
echo "export ROS_HOME_DIR=~/.ros" >> ~/.bashrc
echo "export ROS_BAG_DIR=~/.ros/bags" >> ~/.bashrc
echo "  " >> ~/.bashrc
source ~/.bashrc
echo "------------> Initialized Basic catkin_ws Successfully"
echo "---> Custom Packages now may be Installed"
