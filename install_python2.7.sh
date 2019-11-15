#!/bin/bash

###
 # @Description: Linux下python2.7安装pip
 # @Author: your name
 # @Date: 2019-10-26 17:09:38
 # @LastEditTime: 2019-10-26 17:33:45
 # @LastEditors: Please set LastEditors
###

# 下载并安装setuptools
wget --no-check-certificate https://bootstrap.pypa.io/ez_setup.py
sudo python ez_setup.py --insecure

# python官网下载pip安装包
wget https://pypi.python.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-9.0.1.tar.gz#md5=35f01da33009719497f01a4ba69d63c9
tar -xf pip-9.0.1.tar.gz
cd pip-8.0.0
# 安装
sudo python setup.py install
ln -s /usr/local/python27/bin/pip /usr/bin/pip




sudo apt-get install zlib zlib-devel
# 安装setuptools
wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz
tar -jxvf setuptools-1.4.2.tar.gz
cd setuptools-1.4.2
python setup.py install
# 出现报错：RuntimeError: Compression requires the (missing) zlib module，但实际已经安装成功。
# 解决办法：进入python27的安装目录中重新make，make install后进入setuptools-1.4.2目录中重新运行setup.py

# 安装pip
wget --no-check-certificate https://pypi.python.org/packages/source/p/pip/pip-6.0.7.tar.gz
tar -jxvf pip-6.0.7.tar.gz
cd pip-6.0.7
python setup.py install

# 安装pip后，报pip：command not found 。
# 原因：重新编译过python，重新安装的python的bin目录不在$PATH中。这就导致了‘command not found’
# 解决办法，在.bashrc中加入PATH环境变量：export PATH=$HOME/bin:/usr/local/python27/bin:/usr/local/bin:$PATH
# 执行source .bashrc命令，更新PATH。

# 重新pip后，报ImportError: cannot import name HTTPSHandler；
# 原因在于openssl,openssl-devel两个文件包未正确安装。
# 解决办法：用下来的命令来安装：
# apt install openssl -y
# apt install openssl-devel -y
# 安装完成后，重新安装python:
# make && make install，最后重新安装pip。

# 安装virtualenv（virtualenv 可用来创建python中的虚拟开发环境）
pip install vitrualenv

# 安装完毕后检查是否安装成功：
virtualenv -h
