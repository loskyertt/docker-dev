#
# ~/.bashrc
#

# 中文字体设置
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:zh
export LC_ALL=zh_CN.UTF-8

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Command simplification
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}\t{{.Names}}"'
alias din='docker inspect --format='{{.HostConfig.NetworkMode}}''


PS1='[\u@\h \W]\$ '

# where proxy
proxy(){
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"
  echo "HTTP Proxy on"
}

# where noproxy
noproxy(){
  unset http_proxy
  unset https_proxy
  echo "HTTP Proxy off"
}
