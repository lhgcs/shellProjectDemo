### 
# @Description: 更新所有python包
 # @Version: 1.0
 # @Autor: lhgcs
 # @Date: 2019-11-01 15:31:36
 # @LastEditors: lhgcs
 # @LastEditTime: 2019-11-01 15:43:27
 ###

#!/bin/bash

# 安装pip3
# sudo apt-get install python3-pip


# 升级pip3版本
sudo python3 -m pip install --upgrade pip
# 编辑usr/bin/pip3文件
# from pip import __main__
# if __name__ == '__main__':
#    sys.exit(__main__._main())

##### 方法一（推荐） #####
# 更新包
# pip install --upgrade SomePackage  
# pip uninstall SomePackage  # 卸载包
# pip show SomePackage       # 显示安装包信息
# pip search SomePackage     # 搜索包

pip list     # 列出已安装的包
pip list -o  # 列出可升级的包

##### 方法二 #####
# pip-review更新python所有包（不推荐，先下载所有包才更新，而且其中一个安装出错，不继续往下）

# 安装 pip-review
pip install pip-review

# 查看可更新包
sudo -H pip list --outdated --format=columns
# 安装pip-review
sudo -H pip install pip-review
# 批量下载并更新
sudo -H pip-review --local --interactive
# 自动更新所有包
# pip-review --auto

# 更新包，提供操作可选项：[Y]es, [N]o, [A]ll, [Q]uit
# pip-review --local --interactive

exit 0
