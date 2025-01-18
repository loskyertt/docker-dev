#!/bin/bash

# 运行容器实例
docker run -it --name=opencv-dev ubuntu

# 注：如果在容器中无法进行下载（比如使用 apt install），需要添加 --dns 参数
docker run -it --name=opencv-dev --dns=8.8.8.8 --dns=8.8.4.4 ubuntu

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