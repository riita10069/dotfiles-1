# ~/.bashrc: executed by bash(1) for non-login shells.
[ -z "$PS1" ] && return
shopt -s checkwinsize
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

# enable color support of ls and also add handy aliases
if [ -e /opt/homebrew/bin/gdircolors ]; then
    if [ -f ~/.dir_colors ]; then
        eval `gdircolors ~/.dir_colors`
    fi
    alias ls='gls --color=auto'
else
    if [ -f ~/.dir_colors ]; then
        eval `dircolors ~/.dir_colors`
    fi
    alias ls='ls --color=auto'
fi

# brew で入れたものの設定読み込み
if hash brew 2>/dev/null; then
    # direnv
    if [ -e $(brew --prefix)/bin/direnv ]; then
        eval "$(direnv hook bash)"
    else
        echo "does not exist direnv. plz install from brew"
    fi
    # thefuck
    if [ -e $(brew --prefix)/bin/fuck ]; then
        eval "$(thefuck --alias)"
    else
        echo "does not exist thefuck. plz install from brew"
    fi
    # anyenv
    if [ -e $(brew --prefix)/bin/anyenv ]; then
        if [ -d $HOME/.anyenv ]; then
            eval "$(anyenv init -)"
        fi
    else
        echo "does not exist anyenv. plz install from brew"
    fi
    # bash_completion
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
        GIT_PS1_SHOWDIRTYSTATE=true
    fi
    # google-cloud-sdk
    if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc" ]; then
        source "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"
    fi
    if [ -f "$(brew --prefix)/share/google-cloud-sdk/completion.bash.inc" ]; then
        source "$(brew --prefix)/share/google-cloud-sdk/completion.bash.inc"
    fi
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
