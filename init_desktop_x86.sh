#!/bin/bash
LOG_FILE=/home/user/_init.log
### Preinstall Setup
    echo "###################################################################################" >> $LOG_FILE
    echo "# Tested on Intel i9 with Nvidia RTX" / >> $LOG_FILE
    echo "# --> Flashed with Ubuntu 18.04 LTS  " >> $LOG_FILE
    echo "# --> Kernel : " >> $LOG_FILE
    echo "###################################################################################" >> $LOG_FILE
    echo "----> GO GO Gadget Auto Install" >> $LOG_FILE  
 # Clean-up
    echo " " >> $LOG_FILE
    echo " " >> $LOG_FILE
    chmod -R +x utility_scripts/
    mkdir /home/user/Libraries/
 # Install General Packages 
    ./utility_scripts/env/init_pc_general_pkgs.sh    
    echo "-- General Packages Installed" >> $LOG_FILE
### Initialize User Environment
    echo "----> Initializing User Environment" >> $LOG_FILE 
 # Install CMake Libraries 
    ./utility_scripts/env/install_latest_cmake.sh
    echo "-- Installed Latest CMake" >> $LOG_FILE
 # Install Python Libraries
    ./utility_scripts/env/install_python3_libs.sh
    echo "-- Installed Python3 Libraries" >> $LOG_FILE 
 # Install VS Code 
    ./utility_scripts/sdk/install_vscode.sh
    echo "-- Installed VS Code" >> $LOG_FILE 
  # Install QGIS
    ./utility_scripts/sdk/install_qgis_base.sh
    echo "-- Installed QGIS" >> $LOG_FILE     
### Initialize ROS Environment 
    echo "----> Configuring ROS Environment" >> $LOG_FILE
 # ROS Melodic Base 
    ./utility_scripts/ros/install_files/ros_install_init_ws_melodic.sh
    echo "-- Installed ROS Melodic Base" >> $LOG_FILE
 # ROS Ouster 
    ./utility_scripts/ros/install_files/ros_install_ouster_pkg.sh
    echo "-- Installed Ouster ROS Packages" >> $LOG_FILE         
 # ROS Cartographer Map
    ./utility_scripts/ros/install_files/ros_install_cartographer.sh
    echo "-- Installed Cartographer ROS Packages" >> $LOG_FILE  
 # ROS RTAB Map ~~~
    ./utility_scripts/sdk/install_rtabmap.sh
    echo "-- Built RTAB Mapping Library" >> $LOG_FILE 
    ./utility_scripts/ros/install_files/ros_install_rtab_pkg.sh
    echo "-- Installed RTAB Map ROS Packages" >> $LOG_FILE
