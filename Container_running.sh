#!/bin/bash

# 运行 wayland 协议的容器h实例
docker run -it \
    --name=test-wayland \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY \
    --device=/dev/dri \
    ubuntu:latest

# 运行 pytorch 容器实例
docker run -it --name=pytorch --gpus=all -v ~/workspace/pytorch:/workspace pytorch/pytorch:latest