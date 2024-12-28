#!/bin/bash

# ---------------------------------------- build OpenCV ----------------------------------------
# 拉取源码
git clone https://github.com/opencv/opencv.git

cmake -B build \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=/opt/opencv \
      -D ENABLE_PRECOMPILED_HEADERS=OFF \
      -D BUILD_EXAMPLES=ON ..