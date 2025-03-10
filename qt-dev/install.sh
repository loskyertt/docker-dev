#!/bin/bash

## ------------------------------------------------ 安装必要包 ----------------------------------------------------------
# 更新
sudo apt update && sudo apt upgrade -y

# 需要在容器内安装 OpenGL 和中文字体
sudo apt install -y mesa-common-dev libgl1-mesa-dev fonts-noto-cjk clangd-18 clang-18

# 然后创建链接（主要是 VSCode 会找 /usr/bin/clangd 或者 /usr/sbin/clangd）
sudo ln -s /usr/bin/clangd-18 /usr/bin/clangd
sudo ln -s /usr/bin/clang-18 /usr/bin/clang
sudo ln -s /usr/bin/clang++-18 /usr/bin/clang++