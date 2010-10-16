" Vim color file
"
" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=light

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
    syntax reset
    endif
endif
let g:colors_name="gmarik"

" Customisatios:
hi Todo       cterm=underline ctermbg=none ctermfg=blue guifg=orangered guibg=yellow2
hi Search     cterm=none ctermfg=black ctermbg=yellow guibg=Yellow
"hi Special    cterm=none ctermfg=brown guifg=SlateBlue
hi SpecialKey cterm=none ctermfg=brown guifg=Blue
hi NonText    cterm=none ctermfg=brown gui=bold guifg=Blue
           


"Directory     term=bold            ctermfg=4             guifg=Blue
"ErrorMsg      term=standout        cterm=bold            ctermfg=7      ctermbg=1       guifg=White    guibg=Red
"IncSearch     term=reverse         cterm=reverse         gui=reverse
"Search        term=reverse         ctermfg=0             ctermbg=3      guibg=Yellow
"MoreMsg       term=bold            ctermfg=2             gui=bold       guifg=SeaGreen
"ModeMsg       term=bold            cterm=bold            gui=bold
"LineNr        term=underline       ctermfg=3             guifg=Brown
"Question      term=standout        ctermfg=2             gui=bold       guifg=SeaGreen
"StatusLine    term=bold,reverse    cterm=bold,reverse    gui=bold,reverse
"StatusLineNC  term=reverse         cterm=reverse         gui=reverse
"VertSplit     term=reverse         cterm=reverse         gui=reverse
"Title         term=bold            ctermfg=5             gui=bold       guifg=Magenta
"Visual        term=reverse         cterm=reverse         guibg=LightGrey
"VisualNOS     term=bold,underline  cterm=bold,underline  gui=bold,underline
"WarningMsg    term=standout        ctermfg=1             guifg=Red
"WildMenu      term=standout        ctermfg=0             ctermbg=3      guifg=Black     guibg=Yellow
"Folded        term=standout        ctermfg=4             ctermbg=7      guifg=DarkBlue  guibg=LightGrey
"FoldColumn    term=standout        ctermfg=4             ctermbg=7      guifg=DarkBlue  guibg=Grey
"DiffAdd       term=bold            ctermbg=4             guibg=LightBlue
"DiffChange    term=bold            ctermbg=5             guibg=LightMagenta
"DiffDelete    term=bold            cterm=bold            ctermfg=4      ctermbg=6       gui=bold       guifg=Blue  guibg=LightCyan
"DiffText      term=reverse         cterm=bold            ctermbg=1      gui=bold        guibg=Red
"SignColumn    term=standout        ctermfg=4             ctermbg=7      guifg=DarkBlue  guibg=Grey
"SpellBad      term=reverse         ctermbg=1             gui=undercurl  guisp=Red
"SpellCap      term=reverse         ctermbg=4             gui=undercurl  guisp=Blue
"SpellRare     term=reverse         ctermbg=5             gui=undercurl  guisp=Magenta
"SpellLocal    term=underline       ctermbg=6             gui=undercurl  guisp=DarkCyan
"Pmenu         ctermbg=5            guibg=LightMagenta
"PmenuSel      ctermbg=7            guibg=Grey
"PmenuSbar     ctermbg=7            guibg=Grey
"PmenuThumb    cterm=reverse        gui=reverse
"TabLine       term=underline       cterm=underline       ctermfg=0      ctermbg=7       gui=underline  guibg=LightGrey
"TabLineSel    term=bold            cterm=bold            gui=bold
"TabLineFill   term=reverse         cterm=reverse         gui=reverse
"CursorColumn  term=reverse         ctermbg=7             guibg=Grey90
"CursorLine    term=underline       cterm=underline       guibg=Grey90
"Cursor        guifg=bg             guibg=fg
"lCursor       guifg=bg             guibg=fg
"MatchParen    term=reverse         ctermbg=6             guibg=Cyan
"Normal        cleared
"Comment       term=bold            ctermfg=4             guifg=Blue
"Constant      term=underline       ctermfg=1             guifg=Magenta
"Special       term=bold            ctermfg=5             guifg=SlateBlue
"Identifier    term=underline       ctermfg=6             guifg=DarkCyan
"Statement     term=bold            ctermfg=3             gui=bold       guifg=Brown
"PreProc       term=underline       ctermfg=5             guifg=Purple
"Type          term=underline       ctermfg=2             gui=bold       guifg=SeaGreen
"Underlined    term=underline       cterm=underline       ctermfg=5      gui=underline   guifg=SlateBlue
"Ignore        cterm=bold           ctermfg=7             guifg=bg
"Error         term=reverse         cterm=bold            ctermfg=7      ctermbg=1       guifg=White    guibg=Red
"Todo          term=standout        ctermfg=0             ctermbg=3      guifg=Blue      guibg=Yellow


