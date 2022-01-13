#!/bin/bash
############## Install ETH Zurich Kinematics / Dynamics Library 
cd ~/Libraries && git clone https://github.com/ANYbotics/kindr.git
mkdir -p kindr/build && cd kindr/build
cmake .. -DUSE_CMAKE=true && sudo make install -j4
cd ~/
echo "------------> Installed Kinematics / Dynamics Library Successfully"