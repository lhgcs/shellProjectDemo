/*
 * @Description: 校正网络时间
 * @Version: 1.0
 * @Autor: lhgcs
 * @Date: 2019-11-01 16:34:45
 * @LastEditors: lhgcs
 * @LastEditTime: 2019-11-01 16:34:45
 */

#!/bin/bash

adjustTime() {
    for((i=0;i<12;++i))
	do
		# grep -q 用于if逻辑判断,安静模式，不打印任何标准输出。如果有匹配的内容则立即返回状态值0，-c 只输出匹配行的计数
		ok=$(ping -c 1 202.108.22.5 | grep -c 'ttl')
		if [ "$ok" -eq 0 ]; then
			echo 'ping fail'
		else
			echo 'ping ok!!!'
			if [ $(ntpdate -u ntp.api.bz | grep -c '2017|2018|2019') ]
			then
				echo $(date)
				break
			fi
		fi
		sleep 1
	done
}

adjustTime
