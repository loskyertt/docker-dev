#!/bin/bash

# ---------------------------------------- build OpenCV ----------------------------------------
# 拉取源码
git clone https://github.com/opencv/opencv.git

# 设置安装目录
mkdir -p /opt/pcl_1.14

cmake -B build \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=/opt/opencv \
      -D ENABLE_PRECOMPILED_HEADERS=OFF
# -D ENABLE_PRECOMPILED_HEADERS=OFF 表示禁用预编译头文件

# 编译
cmake --build build -j8
# 安装
cmake --install build