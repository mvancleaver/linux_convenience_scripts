#!/bin/bash

############## Build OpenCV 4.5 from Source w/ CUDA + Python 
cd ~/Documents
version="4.5.0"
echo "------------> Installing OpenCV "${version}
sudo sudo apt-get purge -y *libopencv*
sudo apt-get update -y 
sudo apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y python2.7-dev python3.6-dev python-dev python-numpy python3-numpy
sudo apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
sudo apt-get install -y libv4l-dev v4l-utils qv4l2 v4l2ucp
curl -L https://github.com/opencv/opencv/archive/${version}.zip -o opencv-${version}.zip
curl -L https://github.com/opencv/opencv_contrib/archive/${version}.zip -o opencv_contrib-${version}.zip
unzip opencv-${version}.zip && unzip opencv_contrib-${version}.zip
cd opencv-${version}/ && echo "---> Building OpenCV"
mkdir release && cd release/
cmake -D WITH_CUDA=ON -D WITH_CUDNN=ON -D CUDA_ARCH_BIN="5.3,6.2,7.2" -D CUDA_ARCH_PTX="" -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${version}/modules -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D BUILD_opencv_python3=ON \
        -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/bin/ ..
make clean
make -j3
sudo make install
cd ~/Documents
sudo mv opencv-4.5.0/release/ /usr/local/opencv/
echo '# opencv link ' >> ~/.bashrc
echo "export OPENCV_HOME=/usr/local/opencv" >> ~/.bashrc
echo "export PATH=$OPENCV_HOME/bin:$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$OPENCV_HOME/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
echo '     ' >> ~/.bashrc
source ~/.bashrc
sudo ln -s /usr/local/opencv/ /usr/include/opencv
sudo apt-get install libopencv-core-dev
cd ~/
echo "------------> Installed OpenCV "${version}" Successfully"