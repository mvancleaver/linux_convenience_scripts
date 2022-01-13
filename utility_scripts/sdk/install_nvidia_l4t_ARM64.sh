#!/bin/bash

sudo apt update
sudo pip install jetson-stats
sudo apt install -y nvidia-l4t-jetson-multimedia-api
sudo apt install -y nvidia-l4t-camera
sudo apt install -y nvidia-l4t-multimedia-utils
sudo apt install -y nvidia-l4t-multimedia
sudo apt install -y nvidia-cuda 
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
echo 'export PATH=$CUDA_HOME/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
echo "------------> Installed Nvidia Packages Successfully"
