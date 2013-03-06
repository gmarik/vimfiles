# [gmarik](http://github.com/gmarik)'s [Vim configuration](http://github.com/gmarik/vimfiles)

to try it out:

    $ mkdir -p /tmp/vimtest && cd /tmp/vimtest                               # create and cd to test folder
    $ git clone --recursive https://github.com/gmarik/vimfiles.git ./.vim    # clone recursively with vundle
    $ HOME=`pwd` vim -u .vim/vimrc +BundleInstall +qall                     # run installation in relative to current folder
                                                                            # and using downloaded `vimrc`
    $ HOME=`pwd` vim -u .vim/vimrc                                          # Start using Vim

*NOTE*: add `-g` argument to the `vim` command to use graphical UI if you like
