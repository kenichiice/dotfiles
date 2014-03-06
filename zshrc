case "${TERM}" in screen)
    precmd() {
        echo -ne "\ek$(basename $(pwd))\e\\"
    }
    preexec () {
        echo -ne "\ek#${1%% *}\e\\"
    }
esac

export EDITOR=vim
export PAGER=less
export GREP_OPTIONS=--color=auto
export TERM=xterm-256color

autoload -U compinit
compinit

bindkey -e
#bindkey -r '^W'
#bindkey '^W^F' forward-word
#bindkey '^W^B' backward-word
#bindkey '^W^D' kill-word

ulimit -c unlimited

PROMPT="[%~]
(%U%m%u) %n%# "
#RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? "
REPORTTIME=3

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history

setopt auto_pushd

#setopt correct
setopt list_packed
setopt nolistbeep
setopt noautoremoveslash
setopt complete_aliases
setopt noflowcontrol # Ctrl-s, Ctrl-q を使えるようにする

# 履歴検索のための設定みたい
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

alias view="vim -R"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ls="ls -F"
alias screen="screen -A"

if [ -e ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
