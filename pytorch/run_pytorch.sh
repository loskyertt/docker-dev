#!/bin/bash

# 运行 pytorch 容器实例
docker run -it --name=pytorch --gpus=all -v ~/workspace/pytorch:/workspace pytorch/pytorch:latest