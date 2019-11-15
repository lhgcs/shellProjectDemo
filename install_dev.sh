#!/bin/bash


tar zxvf jsoncpp-0.10.7.tar.gz
sudo apt-get install scons
cd jsoncpp-0.10.7
scons platform=linux-gcc
sudo cp ./libs/linux-gcc-5.4.0/libjson_linux-gcc-5.4.0_libmt.* /usr/local/lib/ -a
tar zxvf openssl-OpenSSL_1_1_1b.tar.gz
cd openssl-OpenSSL_1_1_1b/
sudo ./config no-asm shared
sudo make && make install
sudo make install
tar zxvf curl-7.64.0.tar.gz
./configure
sudo make -j4
sudo make install
sudo apt-get install python3-scipy
sudo pip3 install --upgrade pip
sudo python3.5 -m pip install tensorflow-1.11.0-cp35-none-linux_aarch64.whl
sudo apt-get install libopencv-dev python-opencv
sudo find / -name hdf5.h
sudo apt-get install libhdf5-serial-dev hdf5-tools


# pl2pm 1.mp3


下载安装rkdeveloptool 工具
sudo apt-get install libudev-dev libusb-1.0-0-dev dh-autoreconf
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
autoreconf -i
./configure
make
2. 进入markrom模式 
长按markrom键,按reset键, 等待启动后松开markrom键, 正常情况下此时应该进入markrom模式. (进入mark模式后,系统是黑屏的)
插入typeC-typeA, 连接主机, 在主机上看markrom 模式下, vid/pid 是2207: 330c, 并非96board 上说的2207:0011
3. 烧写emmc
rkdeveloptool db rk3399_loader_v1.08.106.bin
rkdeveloptool wl 0 system.img
rkdeveloptool rd

