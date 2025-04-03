# 1.构建镜像

```bash
docker buildx build -t loskyertt/hexo:node-v23.9.0 .
```

---

# 2.运行容器实例

```bash
docker run -it --name=my-blog -p 4000:4000 -v blog:/root/blog loskyertt/hexo:node-v23.9.0
```

---

# 3.配置`ssh`密钥

```bash
docker cp ~/dotfiles/user/.ssh my-blog:/root/
```

然后进入容器更改`.ssh`及其子目录的权限, 将该文件及其子文件的所有者改为`root`（当前用户）：
```bash
chown -R root:root /root/.ssh

# 确保文件权限设置符合 SSH 的要求
chmod 700 /root/.ssh
chmod 600 /root/.ssh/config
chmod 600 /root/.ssh/id_ed25519
chmod 644 /root/.ssh/id_ed25519.pub
chmod 644 /root/.ssh/known_hosts
```