# 最新版本：node:23.9.0
FROM node:22.14.0

# 设置工作目录
WORKDIR /root/web-dev

# 更新系统并安装所需软件
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y locales \
    && npm install -g npm@11.2.0 \
    && npm install -g @vue/cli@latest \
    && npm install -g create-vue \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置环境变量（防止 locale 问题）
ENV LANG=zh_CN.UTF-8 LANGUAGE=zh_CN:zh LC_ALL=zh_CN.UTF-8

# 启动容器时进入交互模式
CMD ["/bin/bash"]
