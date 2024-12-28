#!/bin/bash

# 更新系统
echo "Updating system packages..."
apt update && apt upgrade -y

# 安装必要的工具和依赖
echo "Installing essential tools and libraries..."
apt install -y build-essential cmake git clangd wget unzip \
    libgtk-3-dev libcanberra-gtk-module libcanberra-gtk3-module

# 安装视频处理相关库
echo "Installing video processing libraries..."
apt install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev

# 安装编解码器和图像处理库
echo "Installing codec and image processing libraries..."
apt install -y libxvidcore-dev libx264-dev libjpeg-dev libpng-dev \
    libtiff-dev gfortran openexr

# 安装 Python 相关依赖
echo "Installing Python libraries..."
apt install -y python3-dev python3-numpy

# 安装中文包
apt install -y language-pack-zh-hans

# 清理无用的包缓存
echo "Cleaning..."
apt autoremove -y
apt clean

echo "All dependencies have been installed successfully!"