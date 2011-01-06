DIR=dotfiles

create_dot_files:
	cd ~/$(DIR); mkdir vim/plugin
	cd ~; ln -s $(DIR)/ctags .ctags; \
		  ln -s $(DIR)/gdbinit .gdbinit; \
		  ln -s $(DIR)/inputrc .inputrc; \
		  ln -s $(DIR)/screenrc .screenrc; \
		  ln -s $(DIR)/vimrc .vimrc; \
		  ln -s $(DIR)/zprofile .zprofile; \
		  ln -s $(DIR)/zshrc .zshrc; \
		  ln -s $(DIR)/vim .vim
