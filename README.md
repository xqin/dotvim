Installation:

		For Linux/Unix:
			git clone https://github.com/xqin/dotvim.git ~/.vim

		For Windows 7:
			git clone https://github.com/xqin/dotvim.git X:\path_to_dotvim


Create symlinks:

		For Linux/Unix:
			ln -s ~/.vim/vimrc ~/.vimrc
			ln -s ~/.vim/gvimrc ~/.gvimrc

		For Windows 7:
			X:
			cd X:\path_to_vim_folder\
			mklink _vimrc .vim\vimrc
			mklink _gvimrc .vim\gvimrc


Switch to the `.vim` directory, and fetch submodules:

    cd .vim
    git submodule init
    git submodule update
