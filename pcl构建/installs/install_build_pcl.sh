#!/bin/bash

# 手动编译

# 更新包列表并升级系统
echo "更新系统并安装依赖项..."
apt update
apt upgrade -y

# 安装基础工具和开发环境
apt install -y build-essential cmake git pkg-config clang clangd wget unzip

# 安装系统库和硬件相关支持
apt install -y \
  libusb-1.0-0-dev \
  libusb-dev \
  libudev-dev \
  freeglut3-dev \
  libxmu-dev \
  libxi-dev \
  libomp-dev

# 安装数学和算法库
apt install -y \
  libboost-all-dev \
  libeigen3-dev \
  libflann-dev \
  libqhull-dev

# 安装 VTK（可视化工具包）
apt install -y libvtk9-dev

# 安装图形和 GUI 相关支持
apt install -y \
  libglew-dev \
  libglfw3-dev \
  libpng-dev \
  libjpeg-dev

# 安装 Qt5 和 OpenGL 支持
apt install -y \
  qtbase5-dev \
  qttools5-dev-tools \
  libqt5opengl5-dev

# 安装点云处理相关库
apt install -y \
  libopenni-dev \
  libopenni2-dev \
  libpcap-dev

# 安装额外的开发工具（可选）
# apt install -y \
#   mono-complete \
#   openjdk-8-jdk \
#   openjdk-8-jre \

# 安装中文包
apt install -y language-pack-zh-hans

# 清理无用的包缓存
apt autoremove -y
apt clean

echo "所有依赖项已安装！准备编译 PCL。"
