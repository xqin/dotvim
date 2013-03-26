if has('menu')
    let g:did_install_default_menus = 1
	set guioptions-=m
	set guioptions-=M
endif

if has('toolbar')
	set guioptions-=T
	set guioptions-=t
endif

" right-hand scrollbar
set guioptions-=r
set guioptions-=T

" left-hand scrollbar
set guioptions-=l
set guioptions-=L

" bottom scrollbar
set guioptions-=b


if !exists('g:GVimrcLoaded')
	winpos 135 100
	set lines=38
	set columns=124
	let g:VimrcLoaded = 1

	if has('libcall')
		let g:MyVimLib = $VIMRUNTIME.'/gvimfullscreen.dll'
		function! ToggleFullScreen()
		    call libcall(g:MyVimLib, 'ToggleFullScreen', -1)
		endfunction
		map <A-Enter> <Esc>:call ToggleFullScreen()<CR>
		map <F11> <Esc>:call ToggleFullScreen()<CR>
	endif
    let g:GVimrcLoaded = 1
endif
