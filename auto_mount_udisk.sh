### 
# @Description: 自动挂在U盘
 # @Version: 1.0
 # @Autor: lhgcs
 # @Date: 2019-11-01 17:15:23
 # @LastEditors: lhgcs
 # @LastEditTime: 2019-11-01 17:29:03
 ###

#!/bin/sh

echo $(date +%Y-%m-%d_%H.%M.%S)

# 挂在目录
mountDir=/mnt
if [ -d $mountDir ]; then 
    umount $mountDir > /dev/null 2>&1  
else
    mkdir $mountDir
fi

diskDeviceInfo=/etc/mount.txt
fdisk -l | grep /dev/ > $diskDeviceInfo
cat $diskDeviceInfo
# 最后一行第一列
diskDevice=$(tail -n -1 $diskDeviceInfo | awk '{print $1}')
if [ -z $diskDevice ]; then
    exit 1
else
    echo "Find usb disk: $diskDevice"
    mount $diskDevice $mountDir
    if [ $? -eq 0 ];then
        echo "mount $diskDevice to $mountDir ok"
    else
        echo 'CAN NOT MOUNT '
    fi
fi
