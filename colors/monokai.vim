" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="monokai"

if exists("g:monokai_original")
    let s:monokai_original = g:monokai_original
else
    let s:monokai_original = 0
endif


hi Boolean         guifg=#AE81FF ctermfg=141
hi Character       guifg=#E6DB74 ctermfg=186
hi Number          guifg=#AE81FF ctermfg=141
hi String          guifg=#E6DB74 ctermfg=186
hi Conditional     guifg=#F92672 ctermfg=197               gui=bold
hi Constant        guifg=#AE81FF ctermfg=141               gui=bold
"hi Cursor guifg=bg guibg=Green gui=NONE
hi Cursor       guifg=black          guibg=yellow		gui=none
"hi Cursor           guifg=bg                guibg=#8ac6f2
"hi Cursor          guifg=#000000 ctermfg=0 guibg=#F8F8F0 ctermbg=15
hi Debug           guifg=#BCA3A3 ctermfg=248               gui=bold
hi Define          guifg=#66D9EF ctermfg=81
hi Delimiter       guifg=#8F8F8F ctermfg=245
hi DiffAdd                       guibg=#13354A ctermbg=236
hi DiffChange      guifg=#89807D ctermfg=244 guibg=#4C4745 ctermbg=238
hi DiffDelete      guifg=#960050 ctermfg=89 guibg=#1E0010 ctermbg=233
hi DiffText                      guibg=#4C4745 ctermbg=238 gui=italic,bold

hi Directory       guifg=#A6E22E ctermfg=148               gui=bold
hi Error           guifg=#960050 ctermfg=89 guibg=#1E0010 ctermbg=233
hi ErrorMsg        guifg=#F92672 ctermfg=197 guibg=#232526 ctermbg=235 gui=bold
hi Exception       guifg=#A6E22E ctermfg=148               gui=bold
hi Float           guifg=#AE81FF ctermfg=141
hi FoldColumn      guifg=#465457 ctermfg=239 guibg=#000000 ctermbg=0
hi Folded          guifg=#465457 ctermfg=239 guibg=#000000 ctermbg=0
"hi Function        guifg=#A6E22E ctermfg=148
hi Function        guifg=#66D9EF ctermfg=81
hi Identifier      guifg=#FD971F ctermfg=208
hi Ignore          guifg=#808080 ctermfg=244 guibg=bg
hi IncSearch       guifg=#C4BE89 ctermfg=180 guibg=#000000 ctermbg=0

"hi Keyword         guifg=#F92672 ctermfg=197               gui=bold
hi Keyword         guifg=#F92672 ctermfg=197
hi Label           guifg=#E6DB74 ctermfg=186               gui=none
hi Macro           guifg=#C4BE89 ctermfg=180               gui=italic

hi MatchParen      guifg=#000000 ctermfg=0 guibg=#FD971F ctermbg=208 gui=bold
hi ModeMsg         guifg=#E6DB74 ctermfg=186
hi MoreMsg         guifg=#E6DB74 ctermfg=186
hi Operator        guifg=#F92672 ctermfg=197

" complete menu
hi Pmenu           guifg=#66D9EF ctermfg=81 guibg=#000000 ctermbg=0
hi PmenuSel                      guibg=#808080 ctermbg=244
hi PmenuSbar                     guibg=#080808 ctermbg=0
hi PmenuThumb      guifg=#66D9EF ctermfg=81

hi PreCondit       guifg=#A6E22E ctermfg=148               gui=bold
hi PreProc         guifg=#A6E22E ctermfg=148
hi Question        guifg=#66D9EF ctermfg=81
hi Repeat          guifg=#F92672 ctermfg=197               gui=bold
hi Search          guifg=#FFFFFF ctermfg=15 guibg=#455354 ctermbg=239
" marks column
hi SignColumn      guifg=#A6E22E ctermfg=148 guibg=#232526 ctermbg=235
hi SpecialChar     guifg=#F92672 ctermfg=197               gui=bold
hi SpecialComment  guifg=#465457 ctermfg=239               gui=bold
"hi Special         guifg=#66D9EF ctermfg=81 guibg=bg      gui=italic
hi Special         guifg=#66D9EF ctermfg=81 guibg=bg
hi SpecialKey      guifg=#888A85 ctermfg=102
"hi SpecialKey      guifg=#888A85 ctermfg=102               gui=italic
"hi SpecialKey      guifg=#66D9EF ctermfg=81               gui=italic

if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#F92672 ctermfg=197               gui=bold
hi StatusLine      guifg=#455354 ctermfg=239 guibg=fg
hi StatusLineNC    guifg=#808080 ctermfg=244 guibg=#080808 ctermbg=0
"hi StorageClass    guifg=#FD971F ctermfg=208               gui=italic
hi StorageClass    guifg=#F92672 ctermfg=197
hi Structure       guifg=#66D9EF ctermfg=81
hi Tag             guifg=#F92672 ctermfg=197               gui=italic
hi Title           guifg=#ef5939 ctermfg=203
hi Todo            guifg=#FFFFFF ctermfg=15 guibg=bg      gui=bold

hi Typedef         guifg=#66D9EF ctermfg=81
hi Type            guifg=#66D9EF ctermfg=81               gui=none
hi Underlined      guifg=#808080 ctermfg=244               gui=underline

hi VertSplit       guifg=#808080 ctermfg=244 guibg=#080808 ctermbg=0 gui=bold
hi VisualNOS                     guibg=#403D3D ctermbg=237
hi Visual                        guibg=#403D3D ctermbg=237
hi WarningMsg      guifg=#FFFFFF ctermfg=15 guibg=#333333 ctermbg=236 gui=bold
hi WildMenu        guifg=#66D9EF ctermfg=81 guibg=#000000 ctermbg=0

if s:monokai_original == 1
   hi Normal          guifg=#F8F8F2 ctermfg=15 guibg=#272822 ctermbg=235
   hi Comment         guifg=#75715E ctermfg=242
   hi CursorLine                    guibg=#3E3D32 ctermbg=237
   hi CursorColumn                  guibg=#3E3D32 ctermbg=237
   hi LineNr          guifg=#BCBCBC ctermfg=250 guibg=#3B3A32 ctermbg=237
   hi NonText         guifg=#BCBCBC ctermfg=250 guibg=#3B3A32 ctermbg=237
else
   hi Normal          guifg=#F8F8F2 ctermfg=15 guibg=#1B1D1E ctermbg=234
   "hi Comment         guifg=#465457 ctermfg=239
   hi Comment         guifg=#75715E ctermfg=242
   hi CursorLine                    guibg=#293739 ctermbg=236
   hi CursorColumn                  guibg=#293739 ctermbg=236
   hi LineNr          guifg=#BCBCBC ctermfg=250 guibg=#232526 ctermbg=235
   hi NonText         guifg=#BCBCBC ctermfg=250 guibg=#232526 ctermbg=235
end

"
" Support for 256-color terminal
"
if &t_Co > 255
   hi Boolean         ctermfg=135
   hi Character       ctermfg=144
   hi Number          ctermfg=135
   hi String          ctermfg=144
   hi Conditional     ctermfg=161               cterm=bold
   hi Constant        ctermfg=135               cterm=bold
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=81
   hi Delimiter       ctermfg=241

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102 cterm=bold

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermfg=219 ctermbg=89
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=135
   hi FoldColumn      ctermfg=67  ctermbg=16
   hi Folded          ctermfg=67  ctermbg=16
   hi Function        ctermfg=118
   hi Identifier      ctermfg=208               cterm=none
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=193 ctermbg=16

   hi Keyword         ctermfg=161               cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=16  ctermbg=208 cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229
   hi Operator        ctermfg=161

   " complete menu
   hi Pmenu           ctermfg=81  ctermbg=16
   hi PmenuSel                    ctermbg=244
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=118               cterm=bold
   hi PreProc         ctermfg=118
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=253 ctermbg=66

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=161               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81  ctermbg=232
   hi SpecialKey      ctermfg=245

   hi Statement       ctermfg=161               cterm=bold
   hi StatusLine      ctermfg=238 ctermbg=253
   hi StatusLineNC    ctermfg=244 ctermbg=232
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=81
   hi Tag             ctermfg=161
   hi Title           ctermfg=166
   hi Todo            ctermfg=231 ctermbg=232   cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=81                cterm=none
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=235
   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16

   hi Normal          ctermfg=252 ctermbg=233
   hi Comment         ctermfg=59
   hi CursorLine                  ctermbg=234   cterm=none
   hi CursorColumn                ctermbg=234
   hi LineNr          ctermfg=250 ctermbg=234
   hi NonText         ctermfg=250 ctermbg=234
end
