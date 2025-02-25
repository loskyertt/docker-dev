docker run -it \
  --name=test-x \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  ubuntu:latest

# 安装 x11 应用，比如 xeyes、xclock
apt install -y x11-apps
