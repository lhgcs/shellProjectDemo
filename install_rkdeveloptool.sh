#!/bin/bash

###
 # @Description: 安装RK3399烧录工具
 # @Author: your name
 # @Date: 2019-10-26 17:11:51
 # @LastEditTime: 2019-10-26 17:17:22
 # @LastEditors: Please set LastEditors
###

# 下载安装rkdeveloptool 工具
sudo apt-get install libudev-dev libusb-1.0-0-dev dh-autoreconf
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
autoreconf -i
./configure
make && make install

'''
烧录方法：
1. 进入markrom模式 
长按markrom键,按reset键, 等待启动后松开markrom键, 正常情况下此时应该进入markrom模式. (进入mark模式后,系统是黑屏的)
2. 连接到主机
插入typeC-typeA, 连接主机, 在主机上看markrom 模式下, vid/pid 是2207: 330c, 并非96board 上说的2207:0011
3. 烧写emmc
rkdeveloptool db rk3399_loader_v1.08.106.bin
# 烧录镜像
rkdeveloptool wl 0 system.img
# 重启
rkdeveloptool rd
'''
