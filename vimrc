" TODO: http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/225852#225852

" General "{{{
set nocompatible  " disable vi compatibility.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set autoread  
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed  " Yanks go on clipboard instead.
set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard
set tags=./tags;$HOME " walk directory tree upto $HOME looking for tags
" Modeline
set modeline
set modelines=5 " default numbers of lines to read for modeline instructions
" Backup
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
" Buffers
set hidden " The current buffer can be put to the background without writing to disk
" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase		" be sensitive when there's a capital letter
set incsearch   "
" "}}}

" Formatting "{{{
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0		" Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start	" more powerful backspacing

set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

syntax on               " enable syntax
filetype plugin indent on             " Automatically detect file types.
" "}}}

" Visual "{{{
set nonumber  " Line numbers off
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.

set novisualbell  " No blinking
set noerrorbells  " No noise.
set vb t_vb= " disable any beeps or flashes on error

set shortmess=atI " Shortens messages
set laststatus=2  " Always show status line.
set ruler  " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window

set nolist " Display unprintable characters f12 - switches
set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 

set mouse-=a   " Disable mouse
set mousehide  " Hide mouse after chars typed

set splitbelow
set splitright

colorscheme gmarik
" "}}}


" Command and Auto commands " {{{
" Sudo write
comm! W exec 'w !sudo -t tee % > /dev/null' | e!

"Auto commands
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file

au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au! BufReadPost       COMMIT_EDITMSG                                  set ft=gitcommit noml | norm 1G
" " }}}

" Key mappings " {{{
nnoremap <silent> <C-F> <C-U> " swap ^u  
nnoremap <silent> <C-U> <C-F> " with ^f : convenience!
nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>rt :tabnew ~/.vim/vimrc<CR>
nnoremap <silent> <LocalLeader>re :e ~/.vim/vimrc<CR>
nnoremap <silent> <LocalLeader>rd :e ~/.vim/ <CR>

" Tabs 
nnoremap <silent> <LocalLeader>[ :tabprev<CR>
nnoremap <silent> <LocalLeader>] :tabnext<CR>
" Duplication 
vnoremap <silent> <LocalLeader>= yP
nnoremap <silent> <LocalLeader>= YP
" Buffers
nnoremap <silent> <LocalLeader>- :bd<CR>
" Split line(opposite to S-J joining line) 
nnoremap <silent> <C-J> gEa<CR><ESC>ew 

" map <silent> <C-W>v :vnew<CR>
" map <silent> <C-W>s :snew<CR>

nnoremap # :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap * #

map <S-CR> A<CR><ESC>
"
" Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
"
" show/Hide hidden Chars
map <silent> <F12> :set invlist<CR>     
"
" generate HTML version current buffer using current color scheme
map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR> 
" " }}}

set runtimepath+=~/.vim/grep.git/ " my dev version
set runtimepath+=~/.vim/vundle.git/ " my dev version

" Plugins " {{{
call vundle#rc()

" trying this 
Bundle 'YankRing.vim'
Bundle 'http://github.com/thinca/vim-quickrun.git'
Bundle 'http://github.com/thinca/vim-poslist.git'
Bundle 'http://github.com/mattn/gist-vim.git'
Bundle 'http://github.com/rstacruz/sparkup.git', {'rtp': 'vim/'}
Bundle 'http://github.com/nelstrom/vim-mac-classic-theme.git'

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
Bundle 'repeat.vim'
Bundle 'surround.vim'
" Bundle 'SuperTab'
Bundle 'file-line'
Bundle 'Align'

" FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'
let g:fuf_modesDisable = [] " {{{
nnoremap <silent> <LocalLeader>h :FufHelp<CR>
nnoremap <silent> <LocalLeader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>@  :FufFile<CR>
nnoremap <silent> <LocalLeader>3  :FufBuffer<CR>
nnoremap <silent> <LocalLeader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>$  :FufDir<CR>
nnoremap <silent> <LocalLeader>5  :FufChangeList<CR>
nnoremap <silent> <LocalLeader>6  :FufMruFile<CR>
nnoremap <silent> <LocalLeader>7  :FufLine<CR>
nnoremap <silent> <LocalLeader>8  :FufBookmark<CR> 
nnoremap <silent> <LocalLeader>*  :FuzzyFinderAddBookmark<CR><CR>
nnoremap <silent> <LocalLeader>9  :FufTaggedFile<CR> 
" " }}}

" Zoomwin
Bundle 'ZoomWin'
noremap <LocalLeader>o :ZoomWin<CR>
vnoremap <LocalLeader>o <C-C>:ZoomWin<CR>
inoremap <LocalLeader>o <C-O>:ZoomWin<CR>
noremap <C-W>+o :ZoomWin<CR>

" tComment
Bundle 'tlib'
Bundle 'tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Command-T
Bundle 'git://git.wincent.com/command-t.git'
let g:CommandTMatchWindowAtTop=1 " show window at top

" Navigation
Bundle 'http://github.com/gmarik/vim-visual-star-search.git'

" " }}}
