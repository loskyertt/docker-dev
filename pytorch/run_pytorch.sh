#!/bin/bash

# 运行 pytorch 容器实例
docker run -it --name=pytorch-dev --gpus=all -v ~/workspace/pytorch:/workspace pytorch/pytorch:latest


## ----------------------------------------------- 字体配置（如果要使用 matplotib） ----------------------------------------------------------
apt update
apt install x11-apps fonts-noto-cjk language-pack-zh-hans


# 注意 python3.10 版本，需要修改为对应容器中的版本
# 将字体复制进去
docker cp SimHei.ttf pytorch:/opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf

# 将字体配置文件复制进去
docker cp matplotlibrc pytorch:/opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data

# 进入容器后清除缓存
rm ~/.cache/matplotlib -rf