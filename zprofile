stty stop undef
stty start undef

if [ -e ~/.zprofile_local ]; then
    source ~/.zprofile_local
fi
