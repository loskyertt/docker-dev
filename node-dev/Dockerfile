FROM node:23.9.0

# 设置工作目录
WORKDIR /root/web-dev

# 更新系统并安装所需软件
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y locales \
    && npm install -g cnpm \
    && npm install -g @vue/cli \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置环境变量（防止 locale 问题）
ENV LANG=zh_CN.UTF-8 LANGUAGE=zh_CN:zh LC_ALL=zh_CN.UTF-8

# 进入 bash 交互模式，并加载 .bashrc
CMD ["/bin/bash", "-l"]
