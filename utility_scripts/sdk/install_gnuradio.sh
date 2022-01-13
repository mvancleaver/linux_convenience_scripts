#!/bin/bash
############## Build/Install GNUradio
# Install Depends 
sudo apt install -y git cmake g++ libboost-all-dev libgmp-dev swig python3-numpy \
                python3-mako python3-sphinx python3-lxml doxygen libfftw3-dev \
                libsdl1.2-dev libgsl-dev libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 \
                liblog4cpp5-dev libzmq3-dev python3-yaml python3-click python3-click-plugins \
                python3-zmq python3-scipy python3-aiohttp-mako hackrf gr-osmosdr
pip3 install git+https://github.com/pyqtgraph/pyqtgraph@develop
pip3 install mako
# Install GNUradio
echo 'export PYTHONPATH=/usr/local/lib/python3/dist-packages:usr/local/lib/python2.7/site-packages:$PYTHONPATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
cd ~/Libraries/ && git clone --recursive https://github.com/gnuradio/gnuradio
cd gnuradio/ && git checkout maint-3.7
mkdir build && cd build
git pull --recurse-submodules=on && git submodule update --init
cmake -DENABLE_GR_UHD=OFF ..
make -j $(nproc --all)
sudo make install 
sudo ldconfig
echo "------------> Successfully Built/Installed GNUradio"