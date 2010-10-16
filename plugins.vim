" Pathogen - plugin manager see ~/.vim/bundle/ for managed plugins
source ~/.vim/bundle/pathogen.vim.git/plugin/pathogen.vim
silent! call pathogen#runtime_append_all_bundles()
"silent! call pathogen#helptags()
" Command-T
let g:CommandTMatchWindowAtTop=1 " show window at top
