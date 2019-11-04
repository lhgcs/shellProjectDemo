### 
# @Description: 设置IP
 # @Version: 1.0
 # @Autor: lhgcs
 # @Date: 2019-11-01 16:30:02
 # @LastEditors: lhgcs
 # @LastEditTime: 2019-11-01 16:34:31
 ###

#!/bin/bash

# 静态IP
IP=192.168.1.123
Mask=255.255.255.0
DNS=192.168.1.1
Gateway=192.168.1.1
resolvFile="/etc/resolv.conf"

ifconfig eth0 down
ifconfig eth0 ${IP} netmask ${Mask} up
route add default gw ${Gateway}
echo "nameserver ${DNS}" > ${resolvFile} 
echo "nameserver 114.114.114.114" >> ${resolvFile}
echo "nameserver 8.8.8.8" >> ${resolvFile}
echo "nameserver 8.8.4.4" >> ${resolvFile}
echo $(ifconfig | grep 192)
ping -c 5 202.108.22.5

# 设置动态IP
/sbin/udhcpc
