# 基础镜像
FROM node:23.9.0

# 维护者信息
LABEL maintainer="loskyertt0403@gmail.com"

# 工作目录
WORKDIR /root/blog

COPY .bashrc /root/.bashrc

# 设置 npm 使用淘宝镜像源并安装 Hexo
# RUN npm config set registry https://registry.npmmirror.com

# 安装 Hexo ，初始化 Hexo 博客并安装依赖
RUN npm install hexo-cli -g \
    && hexo init . \
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
