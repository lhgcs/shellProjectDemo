#!/bin/bash

###
 # @Description: 安装WIFI模块AP6255
 # @Author: your name
 # @Date: 2019-10-26 17:22:55
 # @LastEditTime: 2019-10-26 17:24:50
 # @LastEditors: Please set LastEditors
###

# background: green text: white
print_info(){
    echo -e "\033[42;37m $1 \033[0m"
}

# background: yellow text: white
print_warning(){
    echo -e "\033[43;37m $1 \033[0m"
}

# background: red text: white
print_error(){
    echo -e "\033[41;37m $1 \033[0m"
}

# debian
# export dist=stretch

# ubuntu
export dist=bionic

# 添加仓库
echo "deb http://apt.96rocks.com/${dist}/ ${dist} main" | sudo tee /etc/apt/sources.list.d/apt-96rocks.list

if [ $? == 0 ];then
    print_info "Add the repository ok"
else
    print_error "Add the repository fail"

# Get the pub key
wget -O -  apt.96rocks.com/${dist}/public.key | sudo apt-key add -
if [ $? == 0 ];then
    print_info "Get the pub key ok"
else
    print_error "Get the pub key fail"

# 更新源
sudo apt-get update && sudo apt-get upgrade

# 安装
sudo apt-get install ap6255-firmware

if [ $? == 0 ];then
    print_info "ap6255-firmware ok"
else
    print_error "ap6255-firmware fail"
