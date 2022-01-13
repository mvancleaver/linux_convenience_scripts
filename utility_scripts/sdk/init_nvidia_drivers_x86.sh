#!/bin/bash

echo > "------------> Run the script without elevated privledges"


############## Blacklist Current Video Driver
echo "blacklist nouveau" >> blacklist-nouveau.conf
echo "options nouveau modeset=0" >> blacklist-nouveau.conf
sudo mv blacklist-nouveau.conf /etc/modprobe.d/
sudo update-initramfs -u
echo "------------> Nouveau Graphics Blacklisted Successfully"

############## Nvidia 460.67 PPA Installation --> NOT RECOMMENDED 
#sudo add-apt-repository -y ppa:graphics-drivers/ppa
#sudo apt-get update && sudo apt-get -y install nvidia-driver-440

############## Nvidia 460.67 Source Installation --> RECOMMENDED METHOD
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/460.67/NVIDIA-Linux-x86_64-460.67.run
chmod +x NVIDIA-Linux-x86_64-460.67.run
sudo ./NVIDIA-Linux-x86_64-460.67.run
echo "------------> Installed NVIDIA Graphics 460.67 Successfully"

############## Nvidia CUDA Toolkit 10.2
wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run
sudo sh cuda_10.2.89_440.33.01_linux.run --silent --toolkit --toolkitpath=/usr/local/cuda
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
echo 'export PATH=$CUDA_HOME/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
echo "------------> Installed Nvidia CUDA Toolkit 10.2 Successfully"
