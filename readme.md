# 1.安装 Buildx

检查是否已经安装了`Buildx：`
```bash
docker buildx ls
```
如果输出显示了可用的构建器（builders），说明`Buildx`已经安装好了。

1. **下载 Buildx 插件**：
```bash
mkdir -p ~/.docker/cli-plugins
curl -L https://github.com/docker/buildx/releases/download/v0.12.0/buildx-v0.12.0.linux-amd64 -o ~/.docker/cli-plugins/docker-buildx
chmod +x ~/.docker/cli-plugins/docker-buildx
```
请根据你的系统架构（如 `amd64`、`arm64` 等）选择合适的版本。最好进仓库查看下，选择最新版本下载。

2. **验证安装**：
```bash
docker buildx version
```
如果安装成功，你会看到`Buildx`的版本信息。

3. **使用 Buildx 构建镜像**
安装好`Buildx`后，你可以使用以下命令构建镜像：
```bash
docker buildx build -t your-image:tag .
```

4. **配置 Buildx 使用 BuildKit**
默认情况下，`Buildx`已经使用`BuildKit`作为后端。如果你需要手动配置，可以运行以下命令：
```bash
docker buildx create --name mybuilder --use
```
这会创建一个新的构建器实例，并将其设置为默认使用。

5. **验证 BuildKit 是否启用**
你可以通过以下命令验证 BuildKit 是否启用：
```bash
docker info --format '{{.Swarm.LocalNodeState}} {{.Builder}}'
```
如果输出中包含`BuildKit`，说明`BuildKit`已启用。

---

# 2.容器内的中文设置

1. 对于`ubuntu`“
```bash
apt install -y language-pack-zh-hans
```

2. 对于`debian`：
```bash
apt install locales
dpkg-reconfigure locales
```

3. 也可以编辑`/etc/locale.gen`文件：
```bash
nano /etc/locale.gen
```

找到`zh_CN.UTF-8 UTF-8`并取消注释（删除行前的`#`）。如果没有找到`zh_CN.UTF-8`，则手动添加这一行。然后执行`locale-gen`即可。

4. 最后在`shell`配置文件中添加：
```sh
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:zh
export LC_ALL=zh_CN.UTF-8
```

---

# 3.容器中运行 GUI 程序

只需要在运行容器时加入下面参数即可：
```bash
docker run -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --device /dev/dri \
    --name=your-container \
    your-image
```
这样可以确保`X11 UNIX socket`在容器内可用。对于 Linux 下，还需要执行`xhost +local:docker`以添加`docker`用户的本地 X 访问权限，撤销使用`xhost -local:docker`。