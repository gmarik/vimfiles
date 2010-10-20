
set guioptions=cMg " do not show menu and toolbar
set fuoptions=maxvert,maxhorz
set mouse=a "enable mouse in GUI mode

colorscheme vibrantink2

set guifont=Terminus:h16

if has('mac')
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

" Copy
nnoremap <D-c> yy
" Duplication
vnoremap <silent> <D-d> yP
nnoremap <silent> <D-d> YP

endif
