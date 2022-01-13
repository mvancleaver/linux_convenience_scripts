#!/bin/bash
############## Build/Install RTAB Mapping Library for Jetpack 3.4
# https://github.com/introlab/rtabmap/issues/427

## Install Dependancies 
sudo apt install -y ros-melodic-rtabmap-ros
sudo apt remove -y ros-melodic-cv-bridge ros-melodic-rtabmap-ros
echo "------------> Successfully Installed Dependancies "
## Install Point Cloud Library
#cd /home/user/Libraries 
#git clone https://github.com/PointCloudLibrary/pcl.git
#mkdir -p pcl/build && cd pcl/build 
#cmake -DCMAKE_BUILD_TYPE=Release ..
#sudo make -j4 install
#echo "------------> Successfully Installed Point Cloud Library"

## Install Fast K Nearest Neighbour Library 
cd /home/user/Libraries
git clone git://github.com/ethz-asl/libnabo.git
cd libnabo
SRC_DIR=`pwd`
BUILD_DIR=${SRC_DIR}/build
mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ${SRC_DIR}
sudo make install -j4
echo "------------> Successfully Built Fast K Nearest Neighbour Library"

## Install libpointmatcher Library 
cd /home/user/Libraries
git clone git://github.com/ethz-asl/libpointmatcher.git
cd libpointmatcher
SRC_DIR=`pwd`
BUILD_DIR=${SRC_DIR}/build
mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
cmake -D CMAKE_BUILD_TYPE=RelWithDebInfo ${SRC_DIR}
sudo make install -j4
echo "------------> Successfully Built libpointmatcher"

## Install Octomap 
cd /home/user/Libraries 
git clone https://github.com/OctoMap/octomap.git
mkdir -p octomap/build && cd octomap/build 
sudo cmake ..
sudo make install -j4
echo "------------> Successfully Built Octomap "

## Install g20 Optimizer 
#cd /home/user/Libraries 
#sudo apt install -y libsuitesparse-dev qtdeclarative5-dev qt5-qmake libqglviewer-dev-qt5
#git clone https://github.com/RainerKuemmerle/g2o.git
#mkdir -p g2o/build && cd g2o/build 
#sudo cmake ..
#sudo make install -j4
#echo "------------> Successfully Built g20 Optimizer"

## Install GTSAM Optimizer 
#cd /home/user/Libraries 
#git clone https://github.com/borglab/gtsam.gits
#mkdir -p gtsam/build && cd gtsam/build 
#sudo cmake ..
#sudo make install -j4
#echo "------------> Successfully Built GTSAM Optimizer"

## Build RTAB Map from Source 
cd /home/user/Libraries 
git clone https://github.com/introlab/rtabmap.git
cd rtabmap/build 
cmake .. -DWITH_QT=OFF 
make install -j4
echo "------------> Successfully Built/Installed RTAB Map from Source"