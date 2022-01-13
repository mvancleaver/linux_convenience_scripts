#!/bin/bash

path_to_nvidia_driver=$1
path_to_cuda_driver=$2 

sudo systemctl isolate multi-user.target
sudo modprobe -r nvidia-drm
sudo chmod +x $path_to_nvidia_driver
sudo ./$path_to_nvidia_driver
sudo chmod +x $path_to_cuda_driver
sudo ./$path_to_cuda_driver
nvidia-smi
sudo systemctl start graphical.target
#sudo reboot
