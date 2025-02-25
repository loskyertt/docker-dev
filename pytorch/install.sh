#!/bin/bash

apt update && apt upgrade
apt install -y x11-apps fonts-noto-cjk language-pack-zh-hans

# 初始化 conda
conda init

# 防止conda自动激活环境
conda config --set auto_activate_base false