# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:$PATH

export PATH
unset USERNAME

export PS1='[\u@\h:\w]\$ '
export EDITOR=vim
export PAGER=less
export HISTSIZE=10000
export HISTCONTROL=ignoreboth
export GREP_OPTIONS=--color=auto
export DISTCC_HOSTS="10.41.255.137 10.41.255.83 localhost 10.41.255.11 10.41.255.27"
export CCACHE_PREFIX=distcc
# export MAKEOPTS="-j6"  # 効かない？
#export CLASSPATH=$CLASSPATH:$HOME/lib/junit-4.3.1.jar:/usr/lib/agraph/com.franz.agraph-2-2-4.jar

export LD_LIBRARY_PATH=$HOME/lib
export MANPATH=$HOME/share/man
export TERM=xterm-256color

ulimit -S -c unlimited

stty stop undef
stty start undef
