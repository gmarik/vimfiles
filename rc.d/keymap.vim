nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>re :e ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>rt :tabnew ~/.vimrc<CR>

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

" TODO: http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
cmap w!! %!sudo tee > /dev/null % 

" Plugins
"FuzzyFinder
let g:fuf_modesDisable = []
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

" Zoomwin
noremap <LocalLeader>o :ZoomWin<CR>
vnoremap <LocalLeader>o <C-C>:ZoomWin<CR>
inoremap <LocalLeader>o <C-O>:ZoomWin<CR>
noremap <C-W>+o :ZoomWin<CR>

" Ack
noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

" tComment
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>
"
