# 基础镜像
FROM node:latest

# 维护者信息
LABEL maintainer="loskyertt0403@gmail.com"

# 工作目录
WORKDIR /root/blog

# 设置 npm 使用淘宝镜像源并安装 Hexo
# RUN npm config set registry https://registry.npmmirror.com \
#     && npm install hexo-cli -g
RUN npm install hexo-cli -g

# 初始化 Hexo 博客并安装依赖
RUN hexo init . \
    && npm install

# 配置 Git
RUN git config --global user.name "loskyertt" \
    && git config --global user.email "loskyertt0403@gmail.com"

# 设置挂载卷
VOLUME ["/root/blog"]

# 映射端口
EXPOSE 4000

# 启动容器时进入交互模式
CMD ["/bin/bash"]
