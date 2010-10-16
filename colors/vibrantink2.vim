" Vim color scheme
"
" Name:         vibrantink.vim
" Maintainer:   Jo Vermeulen <jo.vermeulen@gmail.com>
" Last Change:  30 Jul 2007
" License:      public domain
" Version:      1.2
"
" This scheme should work in the GUI and in xterm's 256 color mode. It won't
" work in 8/16 color terminals.
"
" I based it on John Lam's initial VibrantInk port to Vim [1]. Thanks to a
" great tutorial [2], I was able to convert it to xterm 256 color mode. And
" of course, credits go to Justin Palmer for creating the original VibrantInk
" TextMate color scheme [3].
"
" [1] http://www.iunknown.com/articles/2006/09/04/vim-can-save-your-hands-too
" [2] http://frexx.de/xterm-256-notes/
" [3] http://encytemedia.com/blog/articles/2006/01/03/textmate-vibrant-ink-theme-and-prototype-bundle

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "vibrantink2"

if has("gui_running")
    highlight Normal guifg=White   guibg=Black
    highlight Cursor guifg=Black   guibg=Green
    highlight Keyword guifg=#FF6600
    highlight Define guifg=#FF6600
    highlight Comment guifg=#9933CC
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
