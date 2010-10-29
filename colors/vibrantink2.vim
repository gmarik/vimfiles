" Vim color scheme
"
" Name:         vibrantink2.vim
" Maintainer:   http://github.com/gmarik
" Last Change:  2010-10-26
" License:      public domain
" Version:      0.2
"
" I based it on Jo Vermeulen vibrantink.vim"

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "vibrantink2"

hi MergeConflict guibg=red
match MergeConflict /[><]\{7\} /

if has("gui_running")
    highlight Normal guifg=White   guibg=Black
    highlight Cursor guifg=Black   guibg=Green
    highlight Keyword guifg=#FF6600
    highlight Define guifg=#FF6600
    highlight Comment guifg=Gray
    highlight Identifier guifg=cyan gui=NONE
    highlight rubySymbol guifg=#339999 gui=NONE
    highlight rubyStringDelimiter guifg=#33FF33
    highlight rubyInterpolation guifg=White
    highlight rubyPseudoVariable guifg=#339999
    highlight rubyConstant gui=BOLD guifg=#55AA55
    highlight Type guifg=#AAAAFF
    highlight Constant guifg=#FFEE98
    highlight Function guifg=#FFCC00 gui=NONE
    highlight Include guifg=#FFCC00 gui=NONE
    highlight Statement guifg=#FF6600 gui=NONE
    highlight String guifg=#AAFFAA
    highlight Search guibg=yellow
    highlight CursorLine guibg=#323300
else
    set t_Co=256
    highlight Normal ctermfg=White ctermbg=Black
    highlight Cursor ctermfg=Black ctermbg=Green
    highlight Keyword ctermfg=202
    highlight Define ctermfg=202
    highlight Comment ctermfg=98
    highlight Identifier cterm=NONE ctermfg=Cyan
    highlight rubySymbol ctermfg=66
    highlight rubyStringDelimiter ctermfg=82
    highlight rubyInterpolation ctermfg=White
    highlight rubyPseudoVariable ctermfg=66
    highlight rubyConstant cterm=bold ctermfg=68
    highlight Type ctermfg=68
    highlight Constant cterm=bold ctermfg=34
    highlight Function ctermfg=220
    highlight Include ctermfg=220
    highlight Statement ctermfg=202
    highlight String ctermfg=34
    highlight Search ctermbg=yellow
    highlight CursorLine cterm=NONE ctermbg=235
endif
