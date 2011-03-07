" General "{{{
set nocompatible               " be iMproved

set history=256                " Number of things to remember in history.
set timeoutlen=250             " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed         " Yanks go on clipboard instead.
set pastetoggle=<F10>          " toggle between paste and normal: for 'safer' pasting from keyboard
set tags=./tags;$HOME          " walk directory tree upto $HOME looking for tags

set modeline
set modelines=5                " default numbers of lines to read for modeline instructions

set autowrite                  " Writes on make/shell commands
set autoread

set nobackup
set nowritebackup
set directory=/tmp//           " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

set hidden                     " The current buffer can be put to the background without writing to disk

set hlsearch                   " highlight search
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing

let g:is_posix = 1             " vim's default is archaic bourne shell, bring it up to the 90s
" "}}}

" Formatting "{{{
syntax on                      " enable syntax
filetype plugin indent on      " Automatically detect file types.

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
set nonumber                  " Line numbers off
set showmatch                 " Show matching brackets.
set matchtime=2               " Bracket blinking.

set wildmode=longest,list     " At command line, complete longest common string, then list alternatives.

set completeopt=longest,menu  "
set completeopt+=preview

" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
snoremap <expr> <C-p> pumvisible() ? '<C-n>' : '<C-p><C-r>=pumvisible() ? "\<lt>Up>" : ""<CR>'

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

set mouse-=a                  " Disable mouse
set mousehide                 " Hide mouse after chars typed

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
" "}}}

" Key mappings " {{{
nnoremap <C-F> <C-U> " swap ^u
nnoremap <C-U> <C-F> " with ^f : convenience!
nnoremap <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <LocalLeader>rt :tabnew ~/.vim/vimrc<CR>
nnoremap <LocalLeader>re :e ~/.vim/vimrc<CR>
nnoremap <LocalLeader>rd :e ~/.vim/ <CR>

" Tabs
nnoremap <LocalLeader>[ :tabprev<CR>
nnoremap <LocalLeader>] :tabnext<CR>
" Duplication
vnoremap <LocalLeader>= yP
nnoremap <LocalLeader>= YP
" Buffers
nnoremap <LocalLeader>- :bd<CR>
" Split line(opposite to S-J joining line)
nnoremap <C-J> gEa<CR><ESC>ew

" map <silent> <C-W>v :vnew<CR>
" map <silent> <C-W>s :snew<CR>

map <S-CR> A<CR><ESC>

map <LocalLeader>E :Explore<CR>

" Make Control-direction switch between windows (like C-W h, etc)
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

"
" Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
"
" generate HTML version current buffer using current color scheme
map <LocalLeader>2h :runtime! syntax/2html.vim<CR>

ab #e # encoding: UTF-8
" " }}}

" AutoCommands " {{{
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG}               set ft=gitcommit noml list| norm 1G
au! BufWritePost      *.snippet                                       call ReloadAllSnippets()
" " }}}

" Scripts and Bundles " {{{
runtime macros/matchit.vim

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Colorscheme
" Bundle 'molokai'
" colorscheme molokai
" Bundle 'http://github.com/nelstrom/vim-mac-classic-theme.git'

Bundle 'https://github.com/gmarik/ingretu.git'
if has("gui_running")
  colorscheme ingretu
endif

" Programming
Bundle 'jQuery'
Bundle 'rails.vim'

" Snippets
Bundle 'http://github.com/gmarik/snipmate.vim.git'

" Syntax highlight
Bundle 'cucumber.zip'
Bundle 'Markdown'

" Git integration
Bundle 'git.zip'
Bundle 'fugitive.vim'

" (HT|X)ml tool
Bundle 'ragtag.vim'

" Utility
Bundle 'https://github.com/gmarik/sudo-write.git'

Bundle 'repeat.vim'
Bundle 'surround.vim'
" Bundle 'SuperTab'
Bundle 'file-line'
Bundle 'Align'
Bundle 'lastpos.vim'

Bundle 'Indent-Guides'
let g:indent_guides_guide_size = 1

Bundle 'ZoomWin'
noremap <LocalLeader>o :ZoomWin<CR>
vnoremap <LocalLeader>o <C-C>:ZoomWin<CR>
inoremap <LocalLeader>o <C-O>:ZoomWin<CR>

Bundle 'tlib'
Bundle 'tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

Bundle 'http://github.com/gmarik/hlmatch.vim.git'
nnoremap # :<C-u>HlmCword<CR>
nnoremap <leader># :<C-u>HlmGrepCword<CR>
vnoremap # :<C-u>HlmVSel<CR>
vnoremap <leader># :<C-u>HlmGrepVSel<CR>

" FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'
" FuF customisations "{{{
let g:fuf_modesDisable = []
nnoremap <LocalLeader>h :FufHelp<CR>
nnoremap <LocalLeader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <LocalLeader>@  :FufFile<CR>
nnoremap <LocalLeader>3  :FufBuffer<CR>
nnoremap <LocalLeader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <LocalLeader>$  :FufDir<CR>
nnoremap <LocalLeader>5  :FufChangeList<CR>
nnoremap <LocalLeader>6  :FufMruFile<CR>
nnoremap <LocalLeader>7  :FufLine<CR>
nnoremap <LocalLeader>8  :FufBookmark<CR>
nnoremap <LocalLeader>*  :FuzzyFinderAddBookmark<CR><CR>
nnoremap <LocalLeader>9  :FufTaggedFile<CR>
" " }}}

" Command-T
Bundle 'http://github.com/wincent/Command-T.git'
let g:CommandTMatchWindowAtTop=1 " show window at top

" Misc stuff
Bundle '~/Dropbox/.gitrepos/utilz.vim.git'

" my dev stuff
set rtp+=~/.vim/grep.git/ " my dev version
runtime plugin/grep.vim

" trying this
Bundle 'neverland.vim--All-colorschemes-suck'
Bundle 'unimpaired.vim'
Bundle 'Gundo'
Bundle 'https://github.com/int3/vim-extradite'
Bundle 'http://github.com/thinca/vim-quickrun.git'
Bundle 'http://github.com/thinca/vim-poslist.git'
Bundle 'http://github.com/mattn/gist-vim.git'
Bundle 'http://github.com/rstacruz/sparkup.git', {'rtp': 'vim/'}
" " }}}
