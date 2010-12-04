func! g:htmlformat()
  silent! %s/\\"/"/g
  silent! %s/\\n/\r/g
  silent! %s/\\t/\t/g
  silent! %s/></>\r\t</g
endf

func! g:htmldecode()
  silent! %s/&amp;/\&/g
  silent! %s/&lt;/</g
  silent! %s/&gt;/>/g
endf

func! g:sqlformat()
  silent! %s/ \(from\|where\|join\|order\|group\) / \r\t\t \1 /g
endf

func! g:commandTInstall()
  exec ':ruby puts( cmd = "cd #{File.expand_path($LOAD_PATH.grep(/command-?t/i).first)}/command-t/ && git checkout -f master && ruby extconf.rb && make clean && make");
       \ system(cmd)
       \'
  runtime 'command-t.vim'
endf
