#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## -------------------------------------------- Fonts -------------------------------------------------------------- 
# 中文字体设置
#export LANG=zh_CN.UTF-8
#export LANGUAGE=zh_CN:zh
#export LC_ALL=zh_CN.UTF-8


## --------------------------------------------- proxy --------------------------------------------------------------
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


## ----------------------------------------- alise -------------------------------------------------------
# Command symplify
alias ls='ls --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'
alias rtime='/usr/bin/time -f "Real Time: %E\nUser Time: %U\nSys Time: %S"'
alias ip='ip --color=auto'

# cmake
alias cmake-build='cmake -B build'
alias cmake-rm='rm -rf build/CMakeCache.txt build/CMakeFiles'
alias cmake-clean='cmake --build build --target clean'

findbuild() {
    if [[ -z "$1" ]]; then
        echo "Usage: findbuild <path>"
        return 1
    fi
    find "$1" -type d -name "build"
}

## ----------------------------------------- Env path ---------------------------------------------------
# qt 样式
# export QT_STYLE_OVERRIDE=Fusion
export QT_QPA_PLATFORM=xcb


## -------------------------------------------- conda -------------------------------------------------------------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sky/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sky/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sky/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sky/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
# <<< conda initialize <<<


## -------------------------------------------- bash-sytle -------------------------------------------------------------
# Find and set branch name var if in git repository.
git_branch_name() {
    branch=$(git symbolic-ref HEAD 2>/dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ -n "$branch" ]]; then
        echo " - ($branch)"
    fi
}

# Get the current Conda environment name
get_conda_env_name() {
    if [[ -n "$CONDA_PREFIX" ]]; then
        if [[ $(basename "$CONDA_PREFIX") == "miniconda3" ]]; then
            CONDA_ENV="-(base)"
        else
            CONDA_ENV="-($(basename "$CONDA_PREFIX"))"
        fi
    else
        CONDA_ENV=""
    fi
}

# Update PS1 prompt
update_prompt() {
    # Get Conda env
    get_conda_env_name

    # Define color
    local green="\[\e[32m\]"
    local red="\[\e[31m\]"
    local blue="\[\e[34m\]"
    local yellow="\[\e[33m\]"
    local cyan="\[\e[36m\]"
    local magenta="\[\e[35m\]"
    local reset="\[\e[0m\]"
    local bold="\[\e[1m\]"

    # Define datatime and other dynamic information
    local datetime=$(date +"%m/%d %H:%M")
    local git_branch=$(git_branch_name)

    # Update PS1
    # PS1="\n${bold}${green}[${cyan}${datetime}${green}] ${red}\u${blue}@${yellow}\h${reset}:${cyan}\w${magenta}${CONDA_ENV}${reset}${git_branch}\n${bold}${blue} $ ${reset}"
    PS1="\n${bold}${green}[${red}\u${blue}@${cyan}\h${reset}:${cyan}\w${green}]${magenta}${CONDA_ENV}${reset}${git_branch}\n${bold}${blue} $ ${reset}"
}

# Add update_prompt to Prompt_command
PROMPT_COMMAND=update_prompt