#!/bin/bash

docker run -it \
    --name=flutter-dev \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY \
    --device=/dev/dri \
    --device=/dev/bus/usb:/dev/bus/usb \
    ghcr.io/cirruslabs/flutter:3.28.0-0.1.pre

# --device=/dev/bus/usb:/dev/bus/usb 表示挂载 USB 设备（手机设备）

## 进入容器执行
# 查看设备是否已经连接
flutter devices

# 若看到设备无法连接，也可以试着来接受所有的 Android 许可协议
flutter doctor --android-licenses