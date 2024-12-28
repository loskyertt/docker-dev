#!/bin/bash

# 直接安装

# 安装 pcl 和一些列开发工具
echo "安装软件..."
SOFTWARE_LIST=("curl" "libpcl-dev" "x11-apps" "cmake" "clang" "clangd" "libomp-dev" "language-pack-zh-hans")
for software in "${SOFTWARE_LIST[@]}"; do
  echo "正在安装: $software"
  apt install -y "$software"
done

# 安装完成
echo "软件安装完成！"