#!/bin/bash

###
 # @Description: 清空
 # @Author: your name
 # @Date: 2019-10-26 14:53:13
 # @LastEditTime: 2019-11-22 16:00:37
 # @LastEditors: lhgcs
###

sudo mv /var/lib/dpkg/info /var/lib/dpkg/info.old
sudo mkdir /var/lib/dpkg/info

sudo apt-get -f install
sudo apt-get update
sudo apt-get upgrade

sudo rm -rf /var/cache/apt/archives/*.deb
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get clean
