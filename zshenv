typeset -U path PATH
path=(
    $HOME/bin(N-/)
    $HOME/.local/bin(N-/)
    /bin(N-/)
    $path
    /usr/bin(N-/)
    /usr/local/sbin(N-/)
    /usr/sbin(N-/)
)

if [ -e ~/.zshenv_local ]; then
    source ~/.zshenv_local
fi
