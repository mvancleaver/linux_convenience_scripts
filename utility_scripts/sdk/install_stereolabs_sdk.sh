#!/bin/bash
############## Stereolabs ZED SDK 
cd ~/Documents
arch=$(uname -m)
if [ "$arch" == 'x86_64' ]
then
    echo "x86-64bit Architecture Detected"
    echo "Ubuntu 18.04 | CUDA 10.2 Required"
    wget https://download.stereolabs.com/zedsdk/3.5/cu102/ubuntu18
    mv ubuntu18 zed_sdk_35_x86_u1804.run
    chmod +x zed_sdk_35_x86_u1804.run
    ./zed_sdk_35_x86_u18.run -- silent
    cd ~/
    echo "------------> Installed Stereo Lab x86 SDK Successfully"
elif [ "$arch" == 'aarch64' ]
then 
    echo "ARM-64bit Architecture Detected"
    echo "Jetpack 4.5 Required"
    wget https://download.stereolabs.com/zedsdk/3.5/jp45/jetsons
    mv jetsons zed_sdk_jetson_jetpack_45.run
    chmod +x zed_sdk_jetson_jetpack_45.run
    ./zed_sdk_jetson_jetpack_45.run -- silent
    cd ~/ 
    echo "------------> Installed Stereo Lab Jetson SDK Successfully"
else
    echo "$arch Not Currently Supported"
    exit 1
fi