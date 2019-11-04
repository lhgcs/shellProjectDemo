### 
# @Description: USB WIFI
 # @Version: 1.0
 # @Autor: lhgcs
 # @Date: 2019-11-01 16:52:19
 # @LastEditors: lhgcs
 # @LastEditTime: 2019-11-01 17:09:41
 ###

#!/bin/bash

###
 # @description: 在配置文件中设置SSID、password
 # @param {type} 
 # @return: 
###
setSSIDPWD() {
    wifiConfFile='/etc/wpa_supplicant.conf'
    echo ${wifiConfFile}

    wpa=$1
    pwd=$2
    cmd='s/"\(.*\)"'
    echo $cmd
    wpa_line=`sed -n '/ssid/=' ${wifiConfFile}`
    pwd_line=`sed -n '/psk/='  ${wifiConfFile}`
    echo $wpa_line
    echo $pwd_line
    wpa_cmd=${wpa_line}${cmd}'/"'${wpa}'"'"/1"
    pwd_cmd=${pwd_line}${cmd}'/"'${pwd}'"'"/1"
    echo $wpa_cmd
    echo $pwd_cmd
    sed -i $wpa_cmd ${wifiConfFile}   
    sed -i $pwd_cmd ${wifiConfFile}
}

###
 # @description: 启动服务
 # @param {type} 
 # @return: 
###
work() {
    while (( 1 ))
    do
        ok=$(ifconfig | grep 192)
        if [ "$ok" != "" ] 
        then
            break;
        fi

        ifconfig wlan0 down
        killall 'wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf'
        rm -rf /var/run/wpa_supplicant/wlan0

        wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf &
        if [[ $? == 0 ]]
        then
            echo "***************start******************"
        fi
        udhcpc -i wlan0 -n -q -t 6
    done
}


# /etc/wpa_supplicant.conf文件内容

# ctrl_interface=/var/run/wpa_supplicant
# ctrl_interface_group=0
# ap_scan=1

# network={
# ssid="Netcore"
# proto=RSN
# key_mgmt=WPA-PSK
# pairwise=CCMP TKIP
# group=CCMP TKIP
# psk="Aa123456ABC"
# }
