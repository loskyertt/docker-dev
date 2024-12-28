#!/bin/bash

# 运行 qt6.8 开发容器实例（使用 wayland 协议），版本可以在仓库自行选择
docker run -it \
    --name=test-qt \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY \
    --device=/dev/dri \
    stateoftheartio/qt6:6.8-gcc-aqt


## ------------------------------------------------ 安装必要包 ----------------------------------------------------------
# 更新
sudo apt update
sudo apt upgrade

# 需要在容器内安装 OpenGL 和中文字体
sudo apt install -y mesa-common-dev libgl1-mesa-dev fonts-noto-cjk

# wayland 需要
sudo apt install -y weston

# 通过访问权限
xhost +local:docker 

# 若要使用 clangd（注意版本） 语法服务
sudo apt install -y clangd-18
# 然后创建链接
sudo ln -s /usr/bin/clangd-18 /usr/bin/clangd


## ------------------------------------------------ CMakeLists.txt 配置 ----------------------------------------------------------
# 如果在构建时出错，则需要在容器中的 CMakeLists.txt 添加：
set(CMAKE_PREFIX_PATH "/opt/Qt/6.8.0/gcc_64")
# 或者
set(Qt_dir "/opt/Qt/6.8.0/gcc_64/lib/cmake/Qt6")
find_package(Qt6 REQUIRED COMPONENTS Core Widgets HINTS ${Qt_dir})