" vundle.vim  - is a shortcut for Vim Bundle and Is a simple plugin manager for Vim
" Maintainer:   http://github.com/gmarik
" Version:      0.1
" Readme:       http://github.com/gmarik/vundle/blob/master/README.md

" if exists("g:vundle_loaded") || &cp | finish | endif
" let g:vundle_loaded = 1

au BufRead,BufNewFile {bundlerc} set ft=vim

com! -nargs=+ Bundle call vundle#add_bundle(<args>)
com! -nargs=0 BundleRequire call vundle#require_bundles()
com! -nargs=0 BundleSync call vundle#sync_bundles()
com! -nargs=0 BundleInstall call vundle#install_bundles()

let g:bundle_dir = expand('~/.vim/bundle/')
let g:bundles = []
let g:bundle_uris = {}

func! vundle#add_bundle(...)
  let name = split(a:1,'\/')[-1] " potentially break on Windows
  let opts = { 'uri': a:1, 'name' : name , 'path': s:BundlePath(name)}
  " if type(a:2) == type({}) | extend(opts, a:2) | endif
  call add(g:bundles, opts)
endf

func! vundle#rc(...)
  exec 'silent! so '.expand('~/.vim/bundlerc')
  call vundle#require_bundles()
endf

func! vundle#require_bundles()
  let rtp = filter(split(&rtp, ','),'v:val !~# g:bundle_dir')
  let after = [] | let before = []
  for bundle in g:bundles
    let path = s:BundleRuntime(bundle)
    let before += path[0] | let after += path[1]
  endfor
  let &rtp = join(before + rtp + after, ',')
endf

func! vundle#install_bundles()
  call vundle#sync_bundles()
  call vundle#helptagify_bundles()
endf

func! vundle#sync_bundles()
  execute '!mkdir -p '.g:bundle_dir
  for bundle in g:bundles
    let git_dir = bundle.path.'/.git'
    let cmd = isdirectory(git_dir) ?  
          \ '--git-dir='.git_dir.' pull' : 
          \ 'clone '.bundle.uri.' '.bundle.path
    exec '!echo -ne "* '.bundle.name.'"'
    exec '!git '.cmd
  endfor
endf

func! vundle#helptagify_bundles()
  for bundle in g:bundles
    let dir = bundle.path
    if isdirectory(dir.'/doc') && (!filereadable(dir.'/doc/tags') || filewritable(dir.'/doc/tags'))
      helptags `=dir.'/doc'`
    endif
  endfor
endf

func! s:BundlePath(bundle_name)
  return expand(g:bundle_dir.a:bundle_name)
endf

func! s:BundleRuntime(bundle) 
  let before = [a:bundle.path] | let after  = []
  let after_dir = expand(a:bundle.path.'/'.'after')
  if isdirectory(after_dir) | let after = [after_dir] | endif
  return [before, after]
endf 
