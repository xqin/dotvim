if !has('python') || exists('g:vim_cmd_loaded')
  finish
endif

let g:svn_cmd_path = $VIMBALL.'\svn-cmd\svn-cmd.py'

"将当前文件添加至SVN版本库
function! SVN_ADD()
    python import sys
    exe 'python sys.argv = ["svn add \"'.escape(expand('%:p'), '\\').'\""]'
    exe 'pyf '.g:svn_cmd_path
endfunction

"显示当前文件的SVN信息
function! SVN_INFO()
    python import sys
    exe 'python sys.argv = ["svn info \"'.escape(expand('%:p'), '\\').'\""]'
    exe 'pyf '.g:svn_cmd_path
endfunction

"显示当前文件的SVN日志
function! SVN_LOG()
    python import sys
    let Comment = input("请输入显示的记录条数(默认全部):")
    if strlen(Comment) > 0
			exe 'python sys.argv = ["svn log \"'.escape(expand('%:p'), '\\').'\" --limit '.Comment.'"]'
		else
			exe 'python sys.argv = ["svn log \"'.escape(expand('%:p'), '\\').'\""]'
		endif
    exe 'pyf '.g:svn_cmd_path
endfunction

"将当前文件从SVN版本库中删除
function! SVN_DELETE()
    python import sys
    exe 'python sys.argv = ["svn delete \"'.escape(expand('%:p'), '\\').'\""]'
    exe 'pyf '.g:svn_cmd_path
    exe 'python sys.argv = ["svn ci \"'.escape(expand('%:p'), '\\').'\" -m \"Delete File\""]'
    exe 'pyf '.g:svn_cmd_path
    silent! bw!
endfunction

"在当前文件的所在目录中执行svn cleanup操作
function! SVN_CLEAN()
    python import sys
    exe 'python sys.argv = ["svn cleanup \"'.escape(expand('%:p:h'), '\\').'\""]'
    exe 'pyf '.g:svn_cmd_path
endfunction

"将当前文件的修改提交到版本库
function! SVN_CI()
    let Comment = input("请输入注释:")
    if strlen(Comment) > 0
        silent! write!
        python import sys
        exe 'python sys.argv = ["svn ci \"'.escape(expand('%:p'), '\\').'\" -m \"'.Comment.'\""]'
        exe 'pyf '.g:svn_cmd_path
    endif
endfunction

"在当前文件所在的目录中执行svn update操作
function! SVN_UP()
    python import sys
    exe 'python sys.argv = ["svn up \"'.escape(expand('%:p:h'), '\\').'\""]'
    exe 'pyf '.g:svn_cmd_path
endfunction



"自动导出指定版本的svn代码,并调用BC与当前文件进行比较
"function! SVN_Compare()
    "python import sys
    "exe 'python sys.argv = ["svn up \"'.escape(expand('%:p:h'), '\\').'\""]'
    "exe 'pyf '.g:svn_cmd_path
"endfunction

function! OpenCMD()
    !start cmd.exe
endfunction


if !exists('g:vim_cmd_loaded')
    let g:vim_cmd_loaded = 1

    nmap ,add <Esc>:call SVN_ADD()<CR>
    nmap ,info <Esc>:call SVN_INFO()<CR>
    nmap ,log <Esc>:call SVN_LOG()<CR>
    nmap ,del <Esc>:call SVN_DELETE()<CR>
    nmap ,cle <Esc>:call SVN_CLEAN()<CR>
    nmap ,ci <Esc>:call SVN_CI()<CR>
    nmap ,up <Esc>:call SVN_UP()<CR>
    "nmap ,up <Esc>:call SVN_Compare()<CR>
    nmap ,run <Esc>:call OpenCMD()<CR>
    nmap ,cmd <Esc>:call OpenCMD()<CR>
endif

" vim: tabstop=2 shiftwidth=2 softtabstop=2 expandtab
