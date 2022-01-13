#!/bin/bash

echo "------------> Installing ICC Brightness Drivers" 
cd ~/Documents
sudo apt install -y liblcms2-dev
git clone https://github.com/udifuchs/icc-brightness
cd icc-brightness && sudo make install
cd ~/ 
echo "------------> Installed ICC Brightness Drivers Successfully" 

echo "------------> Installing Keyboard Drivers" 
sudo add-apt-repository -y -qq ppa:openrazer/stable ppa:polychromatic/stable
sudo apt update && sudo apt install -y -qq openrazer-meta polychromatic
sudo gpasswd -a $USER plugdev
echo "------------> Installed Keyboard Drivers Successfully" 

echo "------------> Updating Grub to fix Auto log off on Idle" 
#  sudo nano /etc/default/grub
#  change to --> GRUB_CMDLINE_LINUX_DEFAULT=”quiet_splash button.lid_init_state=open”
sudo update-grub
echo "------------> Updated Grub Successfully"
echo "----------------------------------------"
echo "---> Reboot to apply changes" 
echo "----------------------------------------"

