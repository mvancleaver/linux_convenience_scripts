#!/bin/bash

############## Install FLIR ADK Ethernet Components

cd ~/catkin_ws/src
git clone https://github.com/FLIR/flir_adk_ethernet.git
cd ~/catkin_ws && catkin build
echo "------------> InstalledFLIR ADK Ethernet Packages Successfully"
echo "------> Example Usage: roslaunch flir_adk_ethernet blackfly.launch"
echo "------> Example Usage: roslaunch flir_adk_ethernet boson.launch"
echo "---> Rebuilt catkin_ws to utilize"
cd ~/

