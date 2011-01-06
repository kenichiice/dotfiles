DIR=dotfiles

create_dot_files:
	cd ~; \
	    ln -si $(DIR)/ctags .ctags; \
	    ln -si $(DIR)/gdbinit .gdbinit; \
	    ln -si $(DIR)/inputrc .inputrc; \
	    ln -si $(DIR)/screenrc .screenrc; \
	    ln -si $(DIR)/vimrc .vimrc; \
	    ln -si $(DIR)/zprofile .zprofile; \
	    ln -si $(DIR)/zshrc .zshrc; \
	    if [ -d .vim ]; \
	    then echo ".vimは存在しています!"; \
	    else ln -si $(DIR)/vim .vim; \
	    fi
