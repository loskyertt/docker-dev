#!/bin/bash

# 运行 wayland 协议的容器实例
docker run -it \
    --name=test-wayland \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY \
    --device=/dev/dri \
    ubuntu:latest


## -----------------------------------------------------------------------------------

# 运行 pytorch 容器实例
docker run -it --name=pytorch --gpus=all -v ~/workspace/pytorch:/workspace pytorch/pytorch:latest


## -----------------------------------------------------------------------------------

# 运行 qt 开发容器实例（使用 wayland 协议）
docker run -it \
    --name=test-qt \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY \
    --device=/dev/dri \
    stateoftheartio/qt6:6.8-gcc-aqt

# 需要在容器中的设置

# CMakeLists.txt 中需要添加：
set(CMAKE_PREFIX_PATH "/opt/Qt/6.8.0/gcc_64")

# 需要安装 OpenGL
sudo apt install mesa-common-dev libgl1-mesa-dev

## -----------------------------------------------------------------------------------
