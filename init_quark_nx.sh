#!/bin/bash
LOG_FILE=/home/user/init.log
if [ ! -f "$LOG_FILE" ]; then
    echo "$LOG_FILE does not exist."
### Preinstall Setup
    echo "###################################################################################" >> $LOG_FILE
    echo "# Tested on Jetson NX with OEM Developer Carrier Board" / >> $LOG_FILE
    echo "# --> Flashed with Jetson 4.5" >> $LOG_FILE
    echo "# --> Kernel : 4.9.201-v1.0.8" >> $LOG_FILE
    echo "###################################################################################" >> $LOG_FILE
    echo "----> GO GO Gadget Auto Install" >> $LOG_FILE  
 # Clean-up
    echo " " >> $LOG_FILE
    echo " " >> $LOG_FILE
    chmod -R +x utility_scripts/
    rm -rf /home/user/Music /home/user/Pictures /home/user/Public /home/user/Templates \
            /home/user/Videos /home/user/Documents /home/user/Desktop /home/user/examples.desktop
    mkdir /home/user/Libraries/

 # Install General Packages 
    ./utility_scripts/env/init_pc_general_pkgs.sh    
    echo "-- General Packages Installed" >> $LOG_FILE
 # Set User Groups
    ./utility_scripts/env/init_user_groups.sh
    echo "-- User Groups Defined" >> $LOG_FILE
 # Set Communication Interfaces 
    ./utility_scripts/env/init_network_interfaces_cherub.sh
    echo "-- Configured Communication Interfaces" >> $LOG_FILE
 # Create Reboot Resume Service
    #./utility_scripts/env/
    echo "-- Set to Reboot & Resume " >> $LOG_FILE 
    sudo reboot
else
    echo "$LOG_FILE exists." 
### Initialize User Environment
    echo "----> Initializing User Environment" >> $LOG_FILE 
 # Destroy Reboot Resume Service
    #./utility_scripts/env/
 # Set PTP Service 
    ./utility_scripts/env/init_network_PTP.sh
    echo "-- Configured PTP Service" >> $LOG_FILE
 # Install CMake Libraries 
    ./utility_scripts/env/install_latest_cmake.sh
    echo "-- Installed Latest CMake" >> $LOG_FILE
 # Install Python Libraries
    ./utility_scripts/env/install_python3_libs.sh
    echo "-- Installed Python3 Libraries" >> $LOG_FILE 
 # Install VS Code 
    ./utility_scripts/sdk/install_vscode.sh
    echo "-- Installed VS Code" >> $LOG_FILE 
 # Install GNUradio ~~~
    ./utility_scripts/sdk/install_gnuradio.sh
    echo "-- Installed GNUradio" >> $LOG_FILE  
### Initialize ROS Environment 
    echo "----> Configuring ROS Environment" >> $LOG_FILE
 # ROS Melodic Base 
    ./utility_scripts/ros/install_files/ros_install_init_ws_melodic.sh
    echo "-- Installed ROS Melodic Base" >> $LOG_FILE
 # ROS LORD MCSL 
    ./utility_scripts/sdk/install_lord_mcsl.sh
    echo "-- Installed LORD MCSL Library" >> $LOG_FILE 
    ./utility_scripts/ros/install_files/ros_install_lord_mscl_pkg.sh
    echo "-- Installed MCSL ROS Packages" >> $LOG_FILE  
fi