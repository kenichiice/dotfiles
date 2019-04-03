typeset -U path PATH
path=(
    $HOME/bin(N-/)
    $HOME/.local/bin(N-/)
    $HOME/.gem/bin(N-/)
    $HOME/.rbenv/bin(N-/)
    /bin(N-/)
    $path
    /usr/bin(N-/)
    /snap/bin(N-/)
    /usr/local/sbin(N-/)
    /usr/sbin(N-/)
)

export EDITOR=vim
export PAGER=less
#export GREP_OPTIONS=--color=auto
export TERM=xterm-256color

if [ -e ~/.zshenv_local ]; then
    source ~/.zshenv_local
fi
