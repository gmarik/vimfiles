" General "{{{
set nocompatible               " be iMproved

set history=256                " Number of things to remember in history.
set timeoutlen=250             " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed         " Yanks go on clipboard instead.
set pastetoggle=<F10>          " toggle between paste and normal: for 'safer' pasting from keyboard
set shiftround                 " round indent to multiple of 'shiftwidth'
set tags=./tags;$HOME          " walk directory tree upto $HOME looking for tags

set modeline
set modelines=5                " default numbers of lines to read for modeline instructions

set autowrite                  " Writes on make/shell commands
set autoread

set nobackup
set nowritebackup
set directory=/tmp//           " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set noswapfile                 "

set hidden                     " The current buffer can be put to the background without writing to disk

set hlsearch                   " highlight search
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing

let g:is_posix = 1             " vim's default is archaic bourne shell, bring it up to the 90s
let mapleader = ','
" "}}}

" Formatting "{{{
set fo+=o                      " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r                      " Do not automatically insert a comment leader after an enter
set fo-=t                      " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0                " Don't wrap lines by default

set tabstop=2                  " tab size eql 2 spaces
set softtabstop=2
set shiftwidth=2               " default shift width for indents
set expandtab                  " replace tabs with ${tabstop} spaces
set smarttab                   "

set backspace=indent
set backspace+=eol
set backspace+=start

set autoindent
set cindent
set indentkeys-=0#            " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case
" "}}}

" Visual "{{{
syntax on                      " enable syntax

set mouse=a "enable mouse in GUI mode
set mousehide                 " Hide mouse after chars typed

set nonumber                  " line numbers Off
set showmatch                 " Show matching brackets.
set matchtime=2               " Bracket blinking.

set wildmode=longest,list     " At command line, complete longest common string, then list alternatives.

set completeopt+=preview

set novisualbell              " No blinking
set noerrorbells              " No noise.
set vb t_vb=                  " disable any beeps or flashes on error

set laststatus=2              " always show status line.
set shortmess=atI             " shortens messages
set showcmd                   " display an incomplete command in statusline

set statusline=%<%f\          " custom statusline
set stl+=[%{&ff}]             " show fileformat
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P


set foldenable                " Turn on folding
set foldmethod=marker         " Fold on the marker
set foldlevel=100             " Don't autofold anything (but I can still fold manually)

set foldopen=block,hor,tag    " what movements open folds
set foldopen+=percent,mark
set foldopen+=quickfix

set splitbelow
set splitright

set list                      " display unprintable characters f12 - switches
set listchars=tab:\ ·,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
map <silent> <F12> :set invlist<CR>

if has('gui_running')
  set guioptions=cMg " console dialogs, do not show menu and toolbar

  " Fonts
  if has('mac')
  set guifont=Andale\ Mono:h13
  else
  set guifont=Terminus:h16
  end

  if has('mac')
  set noantialias
  " set fullscreen
  set fuoptions=maxvert,maxhorz ",background:#00AAaaaa
  endif
endif
" "}}}

" Key mappings " {{{
" Duplication
nnoremap <leader>c mz"dyy"dp`z
vnoremap <leader>c "dymz"dP`z

nnoremap <C-F> <C-U> " swap ^u
nnoremap <C-U> <C-F> " with ^f : convenience!
nnoremap <leader>rs :source ~/.vimrc<CR>
nnoremap <leader>rt :tabnew ~/.vim/vimrc<CR>
nnoremap <leader>re :e ~/.vim/vimrc<CR>
nnoremap <leader>rd :e ~/.vim/ <CR>

" Tabs
nnoremap <M-h> :tabprev<CR>
nnoremap <M-l> :tabnext<CR>
" Esc
inoremap <leader>, <Esc>
inoremap ;; <Esc>

" Buffers
nnoremap <leader>- :bd<CR>
" Split line(opposite to S-J joining line)
nnoremap <C-J> gEa<CR><ESC>ew

" map <silent> <C-W>v :vnew<CR>
" map <silent> <C-W>s :snew<CR>

" copy filename 
map <silent> <leader>. :let @+=expand('%').':'.line('.')<CR>
" copy path
map <silent> <leader>< :let @+=expand('%:p:h')<CR>


map <S-CR> A<CR><ESC>

map <leader>E :Explore<CR>

" Make Control-direction switch between windows (like C-W h, etc)
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" vertical split with CommandT
nnoremap <leader>v :exec ':vnew \| CommandT'<CR>
" and without
nnoremap <leader>V :vnew<CR>

if has('mac')

set macmeta

" map(range(1,9), 'exec "imap <D-".v:val."> <C-o>".v:val."gt"')
" map(range(1,9), 'exec " map <D-".v:val."> ".v:val."gt"')

" Copy whole line
nnoremap <silent> <D-c> yy
endif

" Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
"
" generate HTML version current buffer using current color scheme
map <leader>2h :runtime! syntax/2html.vim<CR>

ab #e # encoding: UTF-8
" " }}}

" AutoCommands " {{{
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG}               set ft=gitcommit noml list| norm 1G
au! BufWritePost      *.snippet                                       call ReloadAllSnippets()
" " }}}

" Scripts and Bundles " {{{
filetype off
runtime macros/matchit.vim
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Colorscheme
Bundle 'molokai'
Bundle 'nelstrom/vim-mac-classic-theme.git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'git@github.com:gmarik/ingretu.git'

if has("gui_running")
  colorscheme ingretu
endif

" Programming
Bundle 'anzaika/go.vim'
Bundle 'jQuery'
Bundle 'rails.vim'

" Snippets
Bundle 'gh:gmarik/snipmate.vim.git'

" Syntax highlight
Bundle 'cucumber.zip'
Bundle 'git@github.com:gmarik/vim-markdown.git'

" Git integration
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" (HT|X)ml tool
Bundle 'ragtag.vim'

" Utility
Bundle 'gmarik/ide-popup.vim'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'Gundo'

Bundle 'mkitt/browser-refresh.vim'
com! ONRRB :au! BufWritePost <buffer> :RRB
com! NORRB :au! BufWritePost <buffer>

Bundle 'unimpaired.vim'
" bubble current line
nmap <M-j> ]e
nmap <M-k> [e
" bubble visual selection lines
vmap <M-j> ]egv
vmap <M-k> [egv

Bundle 'repeat.vim'
Bundle 'surround.vim'

" Bundle 'SuperTab'
Bundle 'file-line'
Bundle 'Align'
Bundle 'lastpos.vim'

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key='<LocalLeader>'

Bundle 'Indent-Guides'
let g:indent_guides_guide_size = 1

Bundle 'ZoomWin'
noremap <leader>o :ZoomWin<CR>
vnoremap <leader>o <C-C>:ZoomWin<CR>
inoremap <leader>o <C-O>:ZoomWin<CR>

Bundle 'tlib'
Bundle 'tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

Bundle 'git@github.com:gmarik/hlmatch.vim.git'
nnoremap # :<C-u>HlmCword<CR>
nnoremap <leader># :<C-u>HlmGrepCword<CR>
vnoremap # :<C-u>HlmVSel<CR>
vnoremap <leader># :<C-u>HlmGrepVSel<CR>

" FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'
" FuF customisations "{{{
let g:fuf_modesDisable = []
nnoremap <leader>h :FufHelp<CR>
nnoremap <leader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <leader>@  :FufFile<CR>
nnoremap <leader>3  :FufBuffer<CR>
nnoremap <leader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <leader>$  :FufDir<CR>
nnoremap <leader>5  :FufChangeList<CR>
nnoremap <leader>6  :FufMruFile<CR>
nnoremap <leader>7  :FufLine<CR>
nnoremap <leader>9  :FufTaggedFile<CR>

nnoremap <leader>p :FufDir ~/src/<CR>
nnoremap <leader>fr :FufDir ~/.rvm/rubies/<CR>

" " }}}

" Command-T
Bundle 'wincent/Command-T.git'
let g:CommandTMatchWindowAtTop=1 " show window at top

" Misc stuff
Bundle '~/Dropbox/.gitrepos/utilz.vim.git'

" my dev stuff
" Bundle! '~/.vim/grep.git', {'sync':'no'}
Bundle '~/.vim/grep.git', {'sync':'no'}

" trying this
Bundle 'kchmck/vim-coffee-script'
Bundle 'neverland.vim--All-colorschemes-suck'

Bundle 'int3/vim-extradite'
Bundle 'thinca/vim-quickrun.git'
Bundle 'gh:thinca/vim-poslist.git'
Bundle 'github:mattn/gist-vim.git'
Bundle 'rstacruz/sparkup.git', {'rtp': 'vim/'}
Bundle 'Shougo/unite.vim'
call unite#custom_filters('file,buffer,file_rec', ['matcher_fuzzy', 'sorter_default', 'converter_default'])

filetype plugin indent on      " Automatically detect file types.
" " }}}
