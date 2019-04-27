# ~/.bashrc: executed by bash(1) for non-login shells.
[ -z "$PS1" ] && return
shopt -s checkwinsize
export EDITOR=/usr/bin/emacs
export PATH=/usr/local/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin:/bin
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
export LIBRARY_PATH=/usr/local/include/:${LIBRARY_PATH}
export HISTTIMEFORMAT="%y/%m/%d %H:%M:%S: "
export GOPATH="${HOME}/.go"
export PATH="${GOPATH}/bin":$PATH
if [ -d "/usr/local/opt/imagemagick@6/bin" ]; then
    export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
fi
export CONNECTION_REFRESH="true"

export GOENV_DISABLE_GOROOT=1
export GOENV_DISABLE_GOPATH=1

# Bash 4.0 の拡張機能
shopt -s globstar
#shopt -s autocd
shopt -s dirspell

# 複数端末間で履歴を共有
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=300000

# 日本語設定
export LANG=ja_JP.UTF-8
export LC_AL=ja_JP.UTF-8

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval `dircolors ~/.dir_colors`
    alias ls='ls --color=auto'
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# vagrant completion
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    GIT_PS1_SHOWDIRTYSTATE=true
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-256color)
    PS1='${debian_chroot:+($debian_chroot)}\033k\033\\\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\n\[\e[1;32m\]\@\[\e[m\]\[\033[31m\]$(__git_ps1)\[\033[00m\] \$ '
    ;;
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\033k\033\\\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# ファーストログインはscreenを自動起動
# if [ `ps aux | grep "$USER" | grep screen | grep -v Xvfb | wc -l` -le 1 ];
# then
#    if [ -e /var/run/screen/S-"$USER"/* ];
#    then
#        screen -r
#    else
#        screen
#    fi
# fi
