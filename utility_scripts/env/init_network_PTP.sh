#!/bin/bash

############## Install PTP Complex
## Install Depends 
sudo apt update && sudo apt install -y linuxptp chrony ethtool httpie

## Port Config 
echo '#' >> /etc/linuxptp/ptp4l.conf
echo '# USER PORT CONFIG' >> /etc/linuxptp/ptp4l.conf
echo '#' >> /etc/linuxptp/ptp4l.conf
echo 'boundary_clock_jbod 1' >> /etc/linuxptp/ptp4l.conf
echo 'eth0' >> /etc/linuxptp/ptp4l.conf
echo 'eth1' >> /etc/linuxptp/ptp4l.conf

## Service Override
mkdir -p /etc/systemd/system/ptp4l.service.d
echo '[Service]' >> /etc/systemd/system/ptp4l.service.d/override.conf 
echo 'ExecStart=' >> /etc/systemd/system/ptp4l.service.d/override.conf 
echo 'ExecStart=/usr/sbin/ptp4l -f /etc/linuxptp/ptp4l.conf' >> /etc/systemd/system/ptp4l.service.d/override.conf 

## Set PTP as Local Clock -----> phc2sys
# sed -i 's/# clockClass 248 / clockClass 128/' /etc/linuxptp/ptp4l.conf ----> Need to Automate 
mkdir -p /etc/systemd/system/phc2sys.service.d

## Eth0 phc2sys.service
echo '[Service]' >> /etc/systemd/system/phc2sys.service.d/eth0_override.conf
echo 'ExecStart=' >> /etc/systemd/system/phc2sys.service.d/eth0_override.conf
echo 'ExecStart=/usr/sbin/phc2sys -w -s CLOCK_REALTIME -c eth0' >> /etc/systemd/system/phc2sys.service.d/eth0_override.conf

## Eth1 phc2sys.service
echo '[Service]' >> /etc/systemd/system/phc2sys.service.d/eth1_override.conf
echo 'ExecStart=' >> /etc/systemd/system/phc2sys.service.d/eth1_override.conf
echo 'ExecStart=/usr/sbin/phc2sys -w -s CLOCK_REALTIME -c eth1' >> /etc/systemd/system/phc2sys.service.d/eth1_override.conf

## Eth0 phc2shm.service
echo '[Unit]' >> /etc/systemd/system/eth0_phc2shm.service
echo 'Description=Synchronize PTP hardware clock (PHC) to NTP SHM' >> /etc/systemd/system/eth0_phc2shm.service
echo 'Documentation=man:phc2sys' >> /etc/systemd/system/eth0_phc2shm.service
echo 'After=ntpdate.service' >> /etc/systemd/system/eth0_phc2shm.service
echo 'Requires=ptp4l.service' >> /etc/systemd/system/eth0_phc2shm.service
echo 'After=ptp4l.service' >> /etc/systemd/system/eth0_phc2shm.service
echo ' ' >> /etc/systemd/system/eth0_phc2shm.service
echo '[Service]' >> /etc/systemd/system/eth0_phc2shm.service
echo 'Type=simple' >> /etc/systemd/system/eth0_phc2shm.service
echo 'ExecStart=/usr/sbin/phc2sys -s eth0 -E ntpshm -w' >> /etc/systemd/system/eth0_phc2shm.service
echo ' ' >> /etc/systemd/system/eth0_phc2shm.service
echo '[Install]' >> /etc/systemd/system/eth0_phc2shm.service
echo 'WantedBy=multi-user.target' >> /etc/systemd/system/eth0_phc2shm.service

## Eth1 phc2shm.service
echo '[Unit]' >> /etc/systemd/system/eth1_phc2shm.service
echo 'Description=Synchronize PTP hardware clock (PHC) to NTP SHM' >> /etc/systemd/system/eth1_phc2shm.service
echo 'Documentation=man:phc2sys' >> /etc/systemd/system/eth1_phc2shm.service
echo 'After=ntpdate.service' >> /etc/systemd/system/eth1_phc2shm.service
echo 'Requires=ptp4l.service' >> /etc/systemd/system/eth1_phc2shm.service
echo 'After=ptp4l.service' >> /etc/systemd/system/eth1_phc2shm.service
echo ' ' >> /etc/systemd/system/eth1_phc2shm.service
echo '[Service]' >> /etc/systemd/system/eth1_phc2shm.service
echo 'Type=simple' >> /etc/systemd/system/eth1_phc2shm.service
echo 'ExecStart=/usr/sbin/phc2sys -s eth1 -E ntpshm -w' >> /etc/systemd/system/eth1_phc2shm.service
echo ' ' >> /etc/systemd/system/eth1_phc2shm.service
echo '[Install]' >> /etc/systemd/system/eth1_phc2shm.service
echo 'WantedBy=multi-user.target' >> /etc/systemd/system/eth1_phc2shm.service

## Chrony Conf
echo ' ' >> /etc/chrony/chrony.conf
echo '# USER CONFIG ' >> /etc/chrony/chrony.conf
echo 'refclock SHM 0 poll 1 refid ptp' >> /etc/chrony/chrony.conf

## Restart System Daemons
sudo systemctl daemon-reload
# Enable PTP Service
sudo systemctl restart ptp4l
sudo systemctl enable ptp4l
sudo systemctl status ptp4l
# Enable phc2sys Service
sudo systemctl restart phc2sys
sudo systemctl enable phc2sys
sudo systemctl status phc2sys
# Enable eth0_phc2shm Services
sudo systemctl start eth0_phc2shm
sudo systemctl enable eth0_phc2shm
sudo systemctl status eth0_phc2shm
# Enable eth1_phc2shm Services
sudo systemctl start eth1_phc2shm
sudo systemctl enable eth1_phc2shm
sudo systemctl status eth1_phc2shm
# Enable chrony Services
sudo systemctl restart chrony
sudo systemctl enable chrony
sudo systemctl status chrony
