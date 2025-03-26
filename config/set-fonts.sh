#!/bin/bash

# 对于 ubuntu
apt install -y language-pack-zh-hans

# 对于 debian
apt install locales
dpkg-reconfigure locales

# 或者编辑 /etc/locale.gen 文件
nano /etc/locale.gen
locale-gen

# 在 shell 配置文件中添加
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:zh
export LC_ALL=zh_CN.UTF-8