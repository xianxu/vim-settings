#!/bin/sh

# overlaying other repositories on top
echo Update plugins
pushd .vim/bundle/command-t; git pull; popd
pushd .vim/bundle/neocomplcache; git pull; popd
pushd .vim/bundle/nerdcommenter; git pull; popd
pushd .vim/bundle/vim-fugitive; git pull; popd
pushd .vim/bundle/vim-scala; git pull; popd
pushd .vim/bundle/vim-markdown; git pull; popd
pushd .vim/bundle/vim-command-w; git pull; popd
pushd .vim/bundle/vim-protobuf; git pull; popd
pushd .vim/bundle/ctrlp.vim; git pull; popd

echo Building natives
pushd .vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
popd
