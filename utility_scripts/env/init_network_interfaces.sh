#!/bin/bash

sudo ip link delete docker0
sudo ip link delete rndis0

############## Initilize Ethernet Interfaces 
## Use /etc/network/interface.d to configure interfaces at boot
echo "source /etc/network/interfaces.d/*" >> interfaces
sudo mv interfaces /etc/network/
echo "auto lo" >> ifcfg-loopback
echo "iface lo inet loopback" >> ifcfg-loopback
sudo mv ifcfg-loopback /etc/network/interfaces.d/

## Eth0 Interface
eth0_IP=" "
echo "auto eth0" >> ifcfg-eth0
echo "allow-hotplug eth0" >> ifcfg-eth0
echo "iface eth0 inet dhcp" >> ifcfg-eth0
sudo mv ifcfg-eth0 /etc/network/interfaces.d/
echo "------------> Initialized Eth0 with DHCP Addressing"

## Eth1 Interface
eth0_IP="10.0.0.1"
echo "auto eth0" >> ifcfg-eth0
echo "iface eth0 inet static" >> ifcfg-eth0
echo "      address "$eth0_IP  >> ifcfg-eth0
echo "      netmask 255.255.255.0" >> ifcfg-eth0
echo "      gateway "$eth0_IP >> ifcfg-eth0
echo "      dns-nameservers 8.8.8.8" >> ifcfg-eth0
sudo mv ifcfg-eth0 /etc/network/interfaces.d/
echo "------------> Initialized Eth1 with Static IP : "$eth1_IP

## Wifi Driver
sudo add-apt-repository ppa:canonical-hwe-team/backport-iwlwifi -y
sudo apt update && sudo apt install -y backport-iwlwifi-dkms 
wlan0_IP="11.0.0.11"
echo "auto wlan0" >> ifcfg-wlan0
echo "iface wlan0 inet static" >> ifcfg-wlan0
echo "      address $wlan0_IP" >> ifcfg-wlan0
echo "      netmask 255.255.255.0" >> ifcfg-wlan0
echo "      gateway 11.0.0.11" >> ifcfg-wlan0
echo "      dns-nameservers 8.8.8.8" >> ifcfg-wlan0
sudo mv ifcfg-wlan0 /etc/network/interfaces.d/
echo "------------> Initialized Wifi with Static IP : "$wlan0_IP

## USB Ethernet Interface
usb0_IP="11.11.11.11"
echo "auto usb0" >> ifcfg-usb0
echo "iface usb0 inet static" >> ifcfg-usb0
echo "      address $usb0_IP" >> ifcfg-usb0
echo "      netmask 255.255.255.255" >> ifcfg-usb0
echo "      broadcast 11.11.11.111" >> ifcfg-usb0
sudo mv ifcfg-usb0 /etc/network/interfaces.d/
echo "------------> Initialized Mciro USB with Static IP : "$usb0_IP

## CAN0 
sudo apt update && sudo apt install -y can-utils
# Kernel Modules
sudo modprobe can
echo "can" >> /etc/modules-load.d/modules.conf 
sudo modprobe can_dev
echo "can_dev" >> /etc/modules-load.d/modules.conf 
sudo modprobe can_raw
echo "can_raw" >> /etc/modules-load.d/modules.conf 
sudo rm -rf /etc/modprobe.d/blacklist-mttcan.conf
sudo modprobe mttcan
echo "mttcan" >> /etc/modules-load.d/modules.conf 
# Can Bus Interface 
can0_Baud="1000000"
echo "allow-hotplug can0" >> ifcfg-can0
echo "iface can0 can static" >> ifcfg-can0
echo "    bitrate "$can0_Baud >> ifcfg-can0
echo "    post-up /sbin/ip link set can0 txqueuelen 10000" >> ifcfg-can0
sudo mv ifcfg-can0 /etc/network/interfaces.d/
echo "------------> Initialized CAN0 with Baud Rate : "$can0_Baud
# sudo ip link set can0 type can bitrate 1000000
# sudo ip link set can0 type can bitrate 500000
# sudo ip link set up can0
# sudo ifconfig can0 txqueuelen 1000
# sudo ip link set down can0