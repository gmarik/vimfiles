func! Vundle_test()
  redir @r
  :echo g:bundles
  redir end
  :norm "rp
endf

func! Dict_test()
let a = {1: 1}
let b = {2: 2}
let c = []

call extend(a, b)
call add(c, a)

echo c
endf

func! Args_test(...)
  let n = a:1 ? a:1 : 1
  if n
    echon 'ok'
  endif
endf
