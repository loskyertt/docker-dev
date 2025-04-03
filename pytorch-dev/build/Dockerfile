FROM pytorch/pytorch:2.6.0-cuda11.8-cudnn9-runtime

# 设置工作目录
WORKDIR /workspace

# 复制 .bashrc
COPY .bashrc /root/.bashrc

# 安装必要的软件
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    x11-apps \
    fonts-noto-cjk \
    language-pack-zh-hans \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && conda init \
    && conda config --set auto_activate_base false

# 设置环境变量（防止 locale 问题）
ENV LANG=zh_CN.UTF-8 LANGUAGE=zh_CN:zh LC_ALL=zh_CN.UTF-8

# 启动容器时进入交互模式，并加载 .bashrc
CMD ["/bin/bash"]

# CMD ["/bin/bash", "-l"]
