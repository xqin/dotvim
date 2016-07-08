"重新加载gvimrc时不需要再次执行的存放于该条件之下
if !exists('g:GVimrcLoaded')
	let g:GVimrcLoaded = 1

	set linespace=0

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

	if has('mac')
		set lines=37
		set columns=123
	elseif has('win32')
		"remove menu
		let g:did_install_default_menus = 1
		set guioptions-=m
		set guioptions-=M

		"set gui windows position
		winpos 200 60
		"set windows size
		set lines=38
		set columns=124
	endif

	"only for windows
	if has('win32') && has('libcall')
		let g:MyVimLib = $VIMRUNTIME.'/gvimfullscreen.dll'

		function ToggleFullScreen()
			call libcallnr(g:MyVimLib, "ToggleFullScreen", 0)
		endfunction

		map <M-Enter> <Esc>:call ToggleFullScreen()<CR>
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

	"set guifont=Courier_New_for_Powerline:h12:cANSI
	if has('win32')
		:set guifont=Microsoft_YaHei_Mono_for_Powerl:h16:cGB2312
	else
		if has('gui_gtk2')
			:set guifont=Microsoft\ YaHei\ Mono\ for\ Powerline\ 14
		else
			:set guifont=Microsoft\ YaHei\ Mono\ for\ Powerline:h14
		endif
	endif

	set encoding=utf-8
endif

" vim: tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
