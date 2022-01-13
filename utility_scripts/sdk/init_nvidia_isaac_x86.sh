#!/bin/bash

echo "------------> Run the script without elevated privledges"

mkdir -p ~/Libraries/nvidia/isaacSDK/assets 

SRC_FILES=/home/user/Libraries/nvidia/init_env_files
ISAAC_DIR=/home/user/Libraries/nvidia/isaacSDK
SIM_DIR=/home/user/.local/share/ov/pkg/isaac_sim-2021.2.1

############## Isaac Robot SDK
tar -xvf $SRC_FILES/isaac-sdk-20210609-e336b5195.tar.xz -C $ISAAC_DIR
cd $ISAAC_DIR/engine
./engine/build/scripts/install_dependencies.sh
echo "------------> Installed Nvidia Isaac SDK Successfully"
cd ~/

############## Isaac RL GYM
## cd vendor_src/nvidia
tar -xvf $SRC_FILES/IsaacGym_Preview_2_Package.tar.gz -C $ISAAC_DIR 
cd $ISAAC_DIR/isaacgym/python
pip3 install -e .
echo "------------> Installed Nvidia Isaac GYM Successfully"
cd ~/

############## Isaac Omni Sim Assets
#unzip $SRC_FILES/isaac-sim-assets-2021.1.1.zip -d $ISAAC_DIR/assets  
#cd ~/isaacSDK/
#./omniverse-launcher-linux.AppImage

echo "alias runsim='/home/user/.local/share/ov/pkg/isaac_sim-2021.2.1/python.sh'" >> ~/.bashrc
source ~/.bashrc 
runsim -m pip install -r $SIM_DIR/python_samples/requirements.txt
echo "------------> Installed Nvidia Isaac SIM Successfully"
#cd ~/