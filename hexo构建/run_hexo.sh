#!/bin/bash

# 构建镜像
docker build -t loskyertt/hexo:latest .

# 运行容器实例
docker run -it --name=my-blog -p 4000:4000 -v blog:/root/blog loskyertt/hexo:latest

# 把 .bashrc 复制到容器内
docker cp ~/workspace/docker-running/config/.bashrc my-blog:/root/

# 把 .ssh 复制到容器内
docker cp ~/dotfiles/user/.ssh my-blog:/root/

## 进入容器更改 .ssh 及其子目录的权限
# 将该文件及其子文件的所有者改为 root（当前用户）
chown -R root:root /root/.ssh

# 确保文件权限设置符合 SSH 的要求
chmod 700 /root/.ssh
chmod 600 /root/.ssh/config
chmod 600 /root/.ssh/id_ed25519
chmod 644 /root/.ssh/id_ed25519.pub
chmod 644 /root/.ssh/known_hosts