# 1.构建镜像

`devel` vs `runtime` 对比：
| 版本 | 含 `nvcc` | 包含编译工具 | 适用于开发 | 适用于推理 | 体积 |
|------|----------|-------------|-----------|-----------|------|
| **devel** | ✅ 有 | ✅ 有（gcc, make） | ✅ 需要编译 CUDA 扩展 | ❌ 适合但体积较大 | 大 |
| **runtime** | ❌ 无 | ❌ 无（无编译工具） | ❌ 无法编译 CUDA 代码 | ✅ 只运行 PyTorch 代码 | 小 |

```bash
docker buildx build -t pytorch-dev:2.6.0-cuda11.8-cudnn9-runtime .
```

---

# 2. 运行容器

```bash
docker run -itd --name=pytorch-dev --gpus=all -v ~/workspace/pytorch:/workspace pytorch-dev:2.6.0-cuda11.8-cudnn9-runtime
```

如果需要在容器中运行`gui`程序，需要加上参数`-e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix`。

---

# 3.`matplotib`字体配置

- 注意`python`版本，需要修改为对应容器中的版本，将字体复制进去：
```bash
docker cp $HOME/workspace/docker-running/pytorch/font/SimHei.ttf pytorch:/opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf
```

- 将字体配置文件复制进去：
```bash
docker cp $HOME/workspace/docker-running/pytorch/font/matplotlibrc pytorch:/opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data
```

- 进入容器后清除缓存：
```bash
rm ~/.cache/matplotlib -rf
```