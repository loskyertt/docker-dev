# 1.构建镜像

```bash
docker buildx build -t vue-dev:node-v22.14.0 .
```

---

# 2. 运行容器

配置开发环境的时候使用`host`模式，发布镜像的时候用`bridge`模式：
```bash
docker run -itd --name=web-dev --network=host -v $HOME/workspace/web-dev:/root/web-dev vue-dev:node-v22.14.0
```