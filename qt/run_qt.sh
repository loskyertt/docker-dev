#!/bin/bash

# 运行 qt6.8 开发容器实例（使用 wayland 协议），版本可以在仓库自行选择
docker run -it \
    --name=qt-dev \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY \
    --device=/dev/dri \
    stateoftheartio/qt6:6.8-gcc-aqt

# 宿主机中执行：
# 通过访问权限
xhost +local:docker

docker cp $HOME/workspace/docker-running/qt/install.sh qt-dev:/home/user/