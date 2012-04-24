#!/bin/sh

# overlaying other repositories on top
echo Getting plugins
git clone https://github.com/wincent/Command-T.git .vim/bundle/command-t
git clone https://github.com/Shougo/neocomplcache .vim/bundle/neocomplcache
git clone https://github.com/scrooloose/nerdcommenter.git .vim/bundle/nerdcommenter
git clone https://github.com/tpope/vim-fugitive.git .vim/bundle/vim-fugitive
git clone https://github.com/derekwyatt/vim-scala.git .vim/bundle/vim-scala
git clone https://github.com/tpope/vim-markdown.git .vim/bundle/vim-markdown
git clone https://github.com/nathanaelkane/vim-command-w.git .vim/bundle/vim-command-w

echo Building natives
pushd .vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
popd
