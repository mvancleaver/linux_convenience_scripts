#!/bin/bash

############## Realsense2.0 Build from Source with CUDA + Python
cd ~/Documents
sudo apt-get install -y libssl-dev
git clone https://github.com/IntelRealSense/librealsense.git
cd librealsense/
./scripts/setup_udev_rules.sh
mkdir build && cd build
source ~/.bashrc
cmake ../ -DFORCE_RSUSB_BACKEND=ON -DBUILD_PYTHON_BINDINGS:bool=true -DPYTHON_EXECUTABLE=/usr/bin/python3 -DCMAKE_BUILD_TYPE=release \
        -DBUILD_EXAMPLES=true -DBUILD_GRAPHICAL_EXAMPLES=true -DBUILD_WITH_CUDA:bool=true
make -j3
sudo make install
cd ..
sudo cp wrappers/python/pyrealsense2/__init__.py /usr/lib/python3/dist-packages/
sudo mv build/ /usr/local/realsense

echo '# realsense link' >> ~/.bashrc
echo "export RS_HOME=/usr/local/realsense" >> ~/.bashrc
echo "export PATH=$RS_HOME/bin:$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$RS_HOME/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
echo '     ' >> ~/.bashrc

echo '# pyrealsense2 link' >> ~/.bashrc
echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
echo 'export PYTHONPATH=$PYTHONPATH:/usr/local/lib' >> ~/.bashrc
echo 'export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.6/pyrealsense2' >> ~/.bashrc
echo '     ' >> ~/.bashrc
source ~/.bashrc

echo "------------> Installed Realsense SDK Successfully"