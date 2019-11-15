#!/bin/bash

###
 # @Description: 清空
 # @Author: your name
 # @Date: 2019-10-26 14:53:13
 # @LastEditTime: 2019-10-26 14:53:33
 # @LastEditors: Please set LastEditors
###

sudo mv /var/lib/dpkg/info /var/lib/dpkg/info.old
sudo mkdir /var/lib/dpkg/info
sudo apt-get update
sudo apt-get -f install
