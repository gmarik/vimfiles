func! g:htmlformat()
  silent! %s/\\"/"/g
  silent! %s/\\n/\r/g
  silent! %s/\\t/\t/g
  silent! %s/></>\r\t</g
endfun

func! g:htmldecode()
  silent! %s/&amp;/\&/g
  silent! %s/&lt;/</g
  silent! %s/&gt;/>/g
endfun

" vim: ft=vim
