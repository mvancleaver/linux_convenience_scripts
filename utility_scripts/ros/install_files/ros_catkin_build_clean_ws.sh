#!/bin/bash
############## Build the catkin_ws
echo "------------> Rebuilding clean catkin_ws"
cd ~/catkin_ws/
source ~/.bashrc
rosdep install --from-paths src --ignore-src -r -y
catkin_make -DCMAKE_BUILD_TYPE=Release 
source ~/catkin_ws/devel/setup.bash
echo "------------> Successfully Built catkin_ws"
cd ~/