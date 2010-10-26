set guioptions=cMg " console dialogs, do not show menu and toolbar
set mouse=a "enable mouse in GUI mode

colorscheme vibrantink2

if !has('mac')
  set guifont=Terminus:h16
end

if has('mac')
set fullscreen
set fuoptions=maxvert,maxhorz ",background:#00AAaaaa

set guifont=Andale\ Mono:h13
set noantialias

imap      <D-1> <C-o>1gt
imap      <D-2> <C-o>2gt
imap      <D-3> <C-o>3gt
imap      <D-4> <C-o>4gt
imap      <D-5> <C-o>5gt
imap      <D-6> <C-o>6gt
imap      <D-7> <C-o>7gt
imap      <D-8> <C-o>8gt
imap      <D-9> <C-o>9gt
map      <D-1> 1gt
map      <D-2> 2gt
map      <D-3> 3gt
map      <D-4> 4gt
map      <D-5> 5gt
map      <D-6> 6gt
map      <D-7> 7gt
map      <D-8> 8gt
map      <D-9> 9gt

" see $VIMRUNTIME/menu.vim for more 
amenu &File.&Save<Tab><D-s> <D-s>

" see $VIMRUNTIME/macmap.vim  for more
" save file only when changed
nnoremap <silent> <special> <D-s> :if expand("%") == ""<Bar>browse confirm update<Bar> else<Bar>confirm update<Bar>endif<CR>
vmap <special> <D-s> <Esc><D-s>gv
imap <special> <D-s> <C-O><D-s>
cmap <special> <D-s> <C-C><D-s>
omap <special> <D-s> <Esc><D-s>

" Copy
nnoremap <D-c> yy
" Duplication
vnoremap <silent> <D-d> yP
nnoremap <silent> <D-d> YP

endif
