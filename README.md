Installation:

		For Linux/Unix:
			git clone https://github.com/xqin/dotvim.git ~/.vim

		For Windows 7:
			git clone https://github.com/xqin/dotvim.git X:\path_to_vim_folder\vimfiles


Create symlinks:

		For Linux/Unix:
			ln -s ~/.vim/vimrc ~/.vimrc

		For Windows 7:
			X:
			cd X:\path_to_vim_folder\
			mklink _vimrc vimfiles\vimrc


Switch to the `.vim` or `vimfiles` directory, and fetch submodules:

    cd .vim
        or
    cd vimfiles

    git submodule init
    git submodule update
