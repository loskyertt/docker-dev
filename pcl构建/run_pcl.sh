#!/bin/bash

# 运行容器实例
docker run -it \
    --name=pcl-dev \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY \
    --device=/dev/dri \
    pointcloudlibrary/env:22.04

## ------------------------------------------------- deploy pcl-dev env -------------------------------------------------
apt install unzip git wget clangd

# 拉取源码
git clone https://github.com/PointCloudLibrary/pcl.git

# 或者下载指定源码，比如 1.14 版的
wget https://github.com/PointCloudLibrary/pcl/releases/download/pcl-1.14.1/source.zip

# 解压到当前目录
unzip source.zip -d .

# 设置安装目录
mkdir -p /opt/pcl_1.14
cd pcl
cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/pcl_1.14/
# 编译
cmake --build build -j8
# 安装
cmake --build build --target install