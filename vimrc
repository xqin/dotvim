set nocompatible
behave mswin

"""""""""""""""""""""""""""""""""""""""""""""""""
" remap leader
"""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

if has('gui_running')
	if has('menu')
		let g:did_install_default_menus = 1
		set guioptions-=m
		set guioptions-=M
	endif

	if has('toolbar')
		set guioptions-=T
		set guioptions-=t
	endif

	set guioptions-=e

	" right-hand scrollbar
	set guioptions-=r
	set guioptions-=R

	" left-hand scrollbar
	set guioptions-=l
	set guioptions-=L
	" bottom scrollbar
	set guioptions-=b
	"关闭错误声音
	au GUIEnter * set novisualbell vb t_vb=

	if !exists('g:VimrcLoaded')
		winpos 135 100
		set lines=38
		set columns=124
	endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" let $VIMFILES var
"""""""""""""""""""""""""""""""""""""""""""""""""
let $VIMFILES = $VIM.'/vimfiles'
if has('unix')
	let $VIMFILES = '~/.vim'
	if !has('gui_running') && executable('wmctrl')
		function! ToggleFullscreen()
			call system("wmctrl -ir " . v:windowid . " -btoggle,fullscreen")
		endfunction
		map <silent> <F11> :call ToggleFullscreen()<CR>
	endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""
" init vim-pathogen plugin
"""""""""""""""""""""""""""""""""""""""""""""""""
let $MYVIMRC = $VIMFILES.'/vimrc'
let $VIMBALL = $VIMFILES.'/bundle'
source $VIMBALL/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()
"call pathogen#infect()

syntax on
filetype plugin indent on

map <Leader>he :call pathogen#helptags()<CR>

function! SaveFile()
	if expand('%') == ''
		:bro save
	else
		:w
	endif
endfunction

nmap <Leader>s :call SaveFile()<CR>
map <C-S> :call SaveFile()<CR>
imap <C-S> <c-o><c-s>
nmap <Leader>w :bd<CR>
"强制关闭文件
nmap <Leader>W :bd!<CR>
"退出 Vim
nmap <Leader>q :qall<CR>
"强制退出Vim,放弃任何改动
nmap <Leader>Q :qall!<CR>

map <Leader>e :tabnew $MYVIMRC<CR>

"Show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line("."), col(".")), 'synIDattr(v:val, "name")')
endfunction

"快速运行当前文件
map <leader>V :silent !%<CR>
"快速删除整行
map <leader>D dd


nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nmap Q <Nop>
vmap Q <Nop>
map! <F1> <Nop>

nnoremap ; :

nnoremap <leader>v V`]

inoremap jj <ESC>

" Only do this part when compiled with support for autocommands
if has("autocmd")
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\ exe "normal g'\"" |
	\ endif
endif

map <c-o> :browse tabnew<CR>
map <Leader>hi :noh<CR>
map <Leader>u :e ++enc=utf-8<CR>
map <Leader>su :set fileencoding=utf-8<CR>

"在新标签中打开当前光标所在的文件
nmap <silent> <Leader>tn :tabnew <cword><CR>

nnoremap <Leader>1 :set filetype=html<CR>
nnoremap <Leader>2 :set filetype=css<CR>
nnoremap <Leader>3 :set filetype=php<CR>
nnoremap <Leader>4 :set filetype=javascript<CR>
nnoremap <Leader>5 :set filetype=xhtml<CR>
nnoremap <Leader>6 :set filetype=coffee<CR>



"查找当前选区选中的文字,向下
:vnoremap <silent> <Leader>f y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"查找当前选区选中的文字,向上
:vnoremap <silent> <Leader>F y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>




"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

nmap <leader>rr :syntax sync fromstart<CR>


" {{{ Fast Tab Switch
	nmap <c-j> :bnext<CR>
	nmap <c-k> :bprev<CR>
" }}}

" {{{ Fast Tab Switch
	map <C-Tab> :tabnext<CR>
	map <C-S-Tab> :tabprev<CR>
" }}}

cmap <c-a> <Home>
cmap <c-e> <End>
cmap <c-f> <Right>
cmap <c-b> <Left>

" CTRL-C are Copy
vnoremap <C-C> "+yv`]
" CTRL-V and SHIFT-Insert are Paste
imap <C-V> <C-O>"+gP
nmap <Leader>P "+gP
imap <S-Insert> "+gP
"cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+
" 普通模式下 Ctrl+c 复制文件路径
nnoremap <c-c> :let @+ = expand('%:p')<cr>


"选择需要统计的文本
"按下 g<C-g>

":vimgrep /弹冠相庆/gj d:/mydocs/*/*.txt
"如果要包含子文件夹，则用

":vimgrep /弹冠相庆/gj d:/mydocs/**/*.txt
"打开quickfix窗口查看匹配结果
":cw
"在输入模式下移动光标,彻底抛弃方向键
"行首
"inoremap <C-a> <C-O>:SmartHomeKey<CR>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-h> <left>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-l> <Right>

function! MakeTmpFile(ext)
	let s:fname = $TEMP.'/vim_tmp_'.abs(reltimestr(reltime())).'.'.a:ext
	exec ':tabnew '.s:fname
endfunction

map <Leader>n :call MakeTmpFile('html')<CR>
map <Leader>njs :call MakeTmpFile('js')<CR>
map <Leader>ncss :call MakeTmpFile('css')<CR>



" 设置光标颜色
hi Cursor guifg=bg guibg=Green gui=NONE
" 设置插入状态下光标颜色
hi CursorIM guifg=bg guibg=Blue gui=NONE


if !exists('g:VimrcLoaded')
	"设置支持的颜色数
	set t_Co=256

	color monokai
	if has('gui_running') && has('libcall')
		let g:MyVimLib = $VIMRUNTIME.'/gvimfullscreen.dll'
		function ToggleFullScreen()
			call libcallnr(g:MyVimLib, "ToggleFullScreen", 0)
		endfunction
		map <A-Enter> <Esc>:call ToggleFullScreen()<CR>
		"map <A-Enter> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

		let g:VimAlpha = 240
		function! SetAlpha(alpha)
			let g:VimAlpha = g:VimAlpha + a:alpha
			if g:VimAlpha < 180
				let g:VimAlpha = 180
			endif
			if g:VimAlpha > 255
				let g:VimAlpha = 255
			endif
			call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
		endfunction
		nmap <s-y> <Esc>:call SetAlpha(3)<CR>
		nmap <s-t> <Esc>:call SetAlpha(-3)<CR>

		let g:VimTopMost = 0

		function! SwitchVimTopMostMode()
			if g:VimTopMost == 0
				let g:VimTopMost = 1
			else
				let g:VimTopMost = 0
			endif
			call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
		endfunction
		nmap <s-r> <Esc>:call SwitchVimTopMostMode()<CR>
	endif

	"如果把 set encoding=utf-8 放在 ToggleFullScreen 前面
	"则会导致全屏切换快捷键失效
	set encoding=utf-8
	set fileencodings=utf-8,ucs-bom,default,chinese,big5,gbk,gb2312,cp936
	"set guifont=Courier_New_for_Powerline:h12:cANSI
	if has('unix')
		set guifont=Microsoft\ YaHei\ Mono\ for\ Powerline\ 11
		"set guifont=Microsoft_YaHei_Mono_for_Powerline:h12:cGB2312
	else
		set guifont=Microsoft_YaHei_Mono_for_Powerl:h10:cGB2312
	endif

	set fileformat=unix
	set fileformats=dos,unix,mac
	set browsedir=buffer
	set history=256
	set ambiwidth=double
	set linespace=0
	set display=lastline
	set autoread
	set cursorline
	set hidden
	set browsedir=buffer
	set autochdir
	"显示命令
	set showcmd
	"汉字双字节
	set ambiwidth=double

	"上下可视行数
	set scrolloff=3
	"自动保存文件
	set autowrite
	set writebackup
	set nobackup
	set noswapfile
	"不显示首屏
	"set shortmess=atI
	set ignorecase
	set incsearch
	"开启搜索时高亮搜索到的结果
	set hlsearch
	"搜索到结尾时不重新搜索
	set wrapscan
	set smartcase
	"显示括号配对情况
	set showmatch
	"不换行
	set nowrap
	"显示行号
	set number
	set autoindent
	set smartindent
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set expandtab
	set smarttab
	"retab  将tab转换为空格
	"执行外部命令时禁止恢复屏幕内容
	set norestorescreen

	"How many tenths of a second to blink
	set mat=2
	"开启C/C++风格的自动缩进
	set cindent
	"设置自动缩进格式
	set cinoptions=:0g0t0(0
	"set cino=:1g1t1(sus
	"禁止鼠标
	"set selectmode=key
	"关闭鼠标的支持(如果需要开启设置值为a)
	set mouse=a
	" Make the command-line completion better
	set wildmenu
	set copyindent

	"显示相对行号 (与下面的只能有一个生效)
	"set relativenumber
	set helplang=cn,en
	if !has('unix')
		language message zh_CN.UTF-8
	endif

	set shellquote=
	set shellslash
	set shellxquote=
	set shellpipe=2>&1\|tee
	set shellredir=>%s\ 2>&1

	"向右滚动20个字符的位置
	set sidescroll=20

	set nolazyredraw
	set textwidth=99999

	"set colorcolumn=85
	"显示空白及Tab
	set list
	set listchars=tab:\|\ ,extends:>,precedes:<

	"设置删除时可回退的字符, 缩进, 结束符, 行首
	set backspace=indent,eol,start whichwrap+=<,>,[,],h,l

	set complete=.,w,b,u,t,i,d
	set completeopt=longest,menu
	" 重启后撤销历史可用 persistent undo
	set undofile
	set undodir=$VIMFILES/undo/
	set undolevels=1000 "maximum number of changes that can be undone

	"set nobomb
	"与Windows共享剪贴板
	"set clipboard+=unnamed

	"设置代码折叠方式为 手工  indent
	"set foldmethod=manual
	set foldmethod=indent
	set nrformats=octal,hex,alpha
	set virtualedit=block
	"设置代码块折叠后显示的行数
	"set foldexpr=1
	set foldlevel=99


	" alway show status bar
	set laststatus=2
	"set statusline=\ %<%F[%1*%M%*%n%R%H]%6b\[0x%B\]\ %{strftime(\"%m-%d\ %H:%M\")}%=\ %y\ %0(%{&fileformat}\ [%{(&fenc\ ==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %6l:%3c/%L%)

	set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

	"设置命令行的高度为1
	set cmdheight=1
	"设置命令行窗口的高度为
	set cmdwinheight=10
	"关闭标签栏
	set showtabline=0

	"执行cmd将结果返回在新tab中
	"tabe +r\!cmd
endif

autocmd filetype php setlocal dictionary+=$VIMFILES/dict/php_funclist.txt

" {{{ 查找光标位置的单词并生成结果列表
	function! QuickSearchList(visual, ...)
		if empty(expand("%"))
			return 0
		endif
		if a:visual
			let l:saved_reg = @"
			execute "normal! vgvy"
			let	l:pattern = escape(@", '\\/.*$^~[]')
			let l:pattern = substitute(l:pattern, "\n$", "", "")
			let @" = l:saved_reg
		else
			if exists("a:1")
				let l:pattern = a:1
			else
				let l:pattern = expand("<cword>")
			endif
		endif
		execute ":vimgrep /" . l:pattern . "/ %"
		execute ":copen"
		let @/ = l:pattern
		nnoremap <buffer> <silent> q :close<CR>
	endfunction

	command! -nargs=+ SearchList call QuickSearchList(0, <f-args>)
	" 全文搜索选中的文字
	vmap <silent><leader>a :call QuickSearchList(1)<cr>
" }}}


""""""""""""""""""""""""""""""""""""""""""""
" Fast edit hosts file
""""""""""""""""""""""""""""""""""""""""""""
function! FlushDNS()
	python import sys
	exe 'python sys.argv = ["ipconfig /flushdns"]'
	exe 'pyf '.g:svn_cmd_path
endfunction
:nmap <silent> <Leader>ho :tabnew c:\windows\system32\drivers\etc\hosts<CR>
:nmap <silent> <Leader>dns :!ipconfig /flushdns<CR>
autocmd! bufwritepost hosts call FlushDNS()


map <Leader>hc :set cuc!<CR>
map <Leader>ch :call SetColorColumn()<CR>
function! SetColorColumn()
	let col_num = virtcol(".")
	let cc_list = split(&cc, ',')
	if count(cc_list, string(col_num)) <= 0
		execute "set cc+=".col_num
	else
		execute "set cc-=".col_num
	endif
endfunction

"<c-w>+	 <c-w>5+	 增加当前buffer的高度
"<c-w>-	 <c-w>5-	 减少当前buffer的高度

"""""""""""""""""""""""""""""""""""""""
" Plugins Config Start
"""""""""""""""""""""""""""""""""""""""

" {{{ vim-coffee-script
	nnoremap <F5> :GundoToggle<CR>
	autocmd FileType coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" }}}


" {{{ vim-coffee-script
	"1. install nodejs
	"2. npm install -g coffee-script
	"3. npm install -g coffeelint
	nmap <Leader>mc :CoffeeMake<CR>
	nmap <Leader>cv :CoffeeCompile watch vert<CR>
	"au BufWritePost *.coffee silent CoffeeMake! -b | cwindow
" }}}

" {{{ CtrlP
	function! FindInPath()
		let l:fPath = input("请输入目录名:")
		if strlen(l:fPath) > 0
			exec ':CtrlP '.l:fPath
		endif
	endfunction
	map <a-p> :call FindInPath()<CR>
	map <Leader>p :CtrlPBuffer<CR>
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
	set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.msi  " Windows

	let g:ctrlp_custom_ignore = {
				\ 'dir':  '\v[\/]\.(git|hg|svn)$',
				\ 'file': '\v\.(exe|so|dll|zip|msi)$',
				\ 'link': 'some_bad_symbolic_links',
				\ }
	let g:ctrlp_mruf_max = 500
	let g:ctrlp_follow_symlinks = 1
	"let g:ctrlp_map = '<c-p>'
	"let g:ctrlp_cmd = 'CtrlP'
" }}}

" {{{ MRU
	let MRU_Add_Menu = 0
	let MRU_Max_Entries = 500
	let MRU_Window_Height = 20
	nmap <Leader>f :MRU<CR>
" }}}

" {{{ nerdtree
	nmap <F2> :NERDTreeToggle<CR>
" }}}

" {{{ NERD_commenter
"   Turns the menu off
	let NERDMenuMode = 0
" }}}


" {{{ bookmarking.vim colorscheme
	hi BookMarkHighLight guifg=#7F9845 guibg=#232526
	"sign define bookmark text=-> texthl=BookMarkHighLight linehl=BookMarkHighLight
	let g:bookmarking_menu = 0
	map <silent> <F9> :ToggleBookmark<CR>
	map <silent> <F4> :NextBookmark<CR>
	map <silent> <S-F4> :PreviousBookmark<CR>
" }}}


" {{{ calendar.vim plugin
  nmap <Leader>sc :Colorizer<CR>
" }}}

" {{{ powerline.vim plugin
	let g:Powerline_symbols = 'fancy'
	"let g:Powerline_colorscheme = 'solarized256'
	nmap <Leader>r :PowerlineReloadColorscheme<CR>
	"autocmd BufWinEnter * call Pl#UpdateStatusline(1)
" }}}

" {{{ pydiction.vim plugin
	let g:pydiction_location = $VIMBALL.'/pydiction/complete-dict'
	let g:pydiction_menu_height = 10
" }}}

" {{{ smarthome plugin
	map <Home> :SmartHomeKey<CR>
	map <s-6> :SmartHomeKey<CR>
	imap <Home> <C-O>:SmartHomeKey<CR>
" }}}

" {{{ spacebox.vim plugin
	nmap <leader>sm :SpaceBox<CR>
" }}}

" {{{ surround 使用说明
	"	Normal mode
	"	-----------
	"		ds  - delete a surrounding
	"		cs  - change a surrounding
	"		ys  - add a surrounding
	"		yS  - add a surrounding and place the surrounded text on a new line + indent it
	"		yss - add a surrounding to the whole line
	"		ySs - add a surrounding to the whole line, place it on a new line + indent it
	"		ySS - same as ySs

	"	Visual mode
	"	-----------
	"		s   - in visual mode, add a surrounding
	"		S   - in visual mode, add a surrounding but place text on new line + indent it

	"	Insert mode
	"	-----------
	"		<CTRL-s> - in insert mode, add a surrounding
	"		<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
	"		<CTRL-g>s - same as <CTRL-s>
	"		<CTRL-g>S - same as <CTRL-s><CTRL-s>
" }}}

" {{{ vimExplorer.vim plugin
	map <Leader>E :VE %:p:h<CR>
" }}}


" {{{ vim-bad-withespace plugin
	"切换 高亮显示/隐藏 行尾空格
	nmap <Leader>sh :ToggleBadWhitespace<CR>
	"移除 行尾空格行尾
	nmap <Leader>rh :EraseBadWhitespace <CR>
" }}}

" {{{ winmove.vim plugin
	let g:wm_move_left  = '<a-h>'
	let g:wm_move_down  = '<a-j>'
	let g:wm_move_up	= '<a-k>'
	let g:wm_move_right = '<a-l>'
" }}}


"""""""""""""""""""""""""""""""""""""""
" Plugins Config End
"""""""""""""""""""""""""""""""""""""""


"nmap <leader>ed :!start "D:/Program Files/EditPlus 3/editplus.exe" -e %:p<CR>

" Alt-Space is System menu
"if has("gui")
  "noremap <M-Space> :simalt ~<CR>
  "inoremap <M-Space> <C-O>:simalt ~<CR>
  "cnoremap <M-Space> <C-C>:simalt ~<CR>
"endif



"折叠相关的快捷键
"zR Unfold all folded lines in file.
"za Open/Close (toggle) a folded group of lines.
"aA Open a Closed fold or close and open fold recursively.
"zi 全部 展开/关闭 折叠
"zo 展开当前光标所在行
"zc close a folded group of lines
"zC close all fold ed lines recursively
"zM 关闭所有可折叠区域
"map <F3> zo "打开折叠
"map <F4> zc "关闭折叠
"map <F5> zR "打开所有折叠
"map <F6> zM "关闭所有折叠
"常用的折叠快捷键：

"这里就以indent和marker为例来讲讲吧，因为这两种用的比较多：

"如果使用了indent方式，vim会自动的对大括号的中间部分进行折叠，我们可以直接使用这些现成的折叠成果。
"在可折叠处（大括号中间）：

"zc	  折叠
"zC	 对所在范围内所有嵌套的折叠点进行折叠
"zo	  展开折叠
"zO	 对所在范围内所有嵌套的折叠点展开
"[z	   到当前打开的折叠的开始处。
"]z	   到当前打开的折叠的末尾处。
"zj	   向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
"zk	  向上移动到前一折叠的结束处。关闭的折叠也被计入。

"当使用marker方式时，需要用标计来标识代码的折叠，系统默认是{{{和}}}(前面已做出说明)
"我们可以使用下面的命令来创建和删除折叠：

"zf 创建折叠，比如在marker方式下：
"zf56G，创建从当前行起到56行的代码折叠；
"10zf或10zf+或zf10↓，创建从当前行起到后10行的代码折叠。
"10zf-或zf10↑，创建从当前行起到之前10行的代码折叠。
"在括号处zf%，创建从当前行起到对应的匹配的括号上去（（），{}，[]，<>等）。
"zd 删除 (delete) 在光标下的折叠。仅当 'foldmethod' 设为 "manual" 或 "marker" 时有效。
"zD 循环删除 (Delete) 光标下的折叠，即嵌套删除折叠。
		 "仅当 'foldmethod' 设为 "manual" 或 "marker" 时有效。
"zE 除去 (Eliminate) 窗口里“所有”的折叠。
		 "仅当 'foldmethod' 设为 "manual" 或 "marker" 时有效。"


"启动时自动最大化
"au GUIENTER * simalt~x
au BufReadPost *.exe %!xxd
map <A-w> :set wrap!<CR>

autocmd FileType py,yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
let g:VimrcLoaded = 1

" vim: tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
