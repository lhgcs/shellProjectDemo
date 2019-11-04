### 
# @Description: PC加速
 # @Version: 1.0
 # @Autor: lhgcs
 # @Date: 2019-11-01 15:31:36
 # @LastEditors: lhgcs
 # @LastEditTime: 2019-11-01 15:43:27
 ###

#!/bin/bash

# 软件包清单
# libreoffice-common libreoffice（可以换 WPS）
# unity-webapps-common Amazon 链接
# thunderbird 雷鸟邮件客户端
# totem 自带的播放器
# rhythmbox 自带的音乐播放器
# empathy 自带的即时聊天应用
# brasero 自带的光盘刻录器
# simple-scan 扫描仪
# gnome-mahjongg 对对碰游戏
# aisleriot 纸牌游戏
# gnome-mines 扫雷游戏
# cheese webcam 应用
# gnome-sudoku 数独游戏
# transmission-common BT 客户端
# gnome-orca 屏幕阅读
# webbrowser-app Ubuntu 自带的浏览器（有了 chrome 和 Firefox 根本用不到这个）
# landscape-client-ui-install landscape 远程控制软件
# deja-dup 备份
# onboard 屏幕键盘

# 卸载ubuntu自带的软件
sudo apt-get remove unity-webapps-common  # 亚马孙
sudo apt-get remove thunderbird           # 雷鸟
sudo apt-get remove gnome-mahjongg        # 对对碰游戏
sudo apt-get remove aisleriot             # 纸牌游戏
sudo apt-get remove gnome-mines           # 扫雷游戏
sudo apt-get remove gnome-sudoku          # 数独游戏
sudo apt-get remove webbrowser-app        # 浏览器
sudo apt-get remove --purge libreoffice*  # office
# sudo apt-get remove libreoffice-common
# –purge 彻底的移除

sudo apt-get remove grub-pc
sudo apt-get remove unattended-upgrades

# 更新
sudo apt-get update
sudo apt-get upgrade
# 卸载孤立包
sudo apt-get autoremove
sudo apt-get autoclean
# 存储的安装包全部卸载
sudo apt-get clean
# sudo du –h /var/cache/apt/archives
# 检查是否有损坏的依赖
sudo apt-get check 

# 清空缓存
sync
# sudo rm -rf  /home/ubuntu/.cache/vmware/drag_and_drop
sudo rm -rf  ~/.cache
sudo rm -rf  ~/.thumbs

history -c
