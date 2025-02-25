#!/bin/bash

# 运行 wayland 协议的容器实例
docker run -it \
    --name=test-wayland \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY \
    --device=/dev/dri \
    ubuntu:latest

# --device=/dev/dri 参数能把显卡驱动传进去，提高处理图形的性能

# wayland 应用，比如 wayland-terminal
apt install -y weston