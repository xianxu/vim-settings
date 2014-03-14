#!/bin/bash

# overlaying other repositories on top
echo Update plugins
pushd .vim/bundle/neocomplcache; git pull; popd
pushd .vim/bundle/nerdcommenter; git pull; popd
pushd .vim/bundle/vim-fugitive; git pull; popd
pushd .vim/bundle/vim-scala; git pull; popd
pushd .vim/bundle/vim-markdown; git pull; popd
pushd .vim/bundle/vim-command-w; git pull; popd
pushd .vim/bundle/vim-protobuf; git pull; popd
pushd .vim/bundle/ctrlp.vim; git pull; popd
pushd .vim/bundle/splice; git pull; popd
pushd .vim/bundle/vim-characterize; git pull; popd
pushd .vim/bundle/vim-airline; git pull; popd
pushd .vim/bundle/vim-slime; git pull; popd
pushd .vim/bundle/vimproc.vim; git pull; popd
pushd .vim/bundle/syntastic; git pull; popd
pushd .vim/bundle/neco-ghc; git pull; popd
pushd .vim/bundle/tabular; git pull; popd
pushd .vim/bundle/html-template-syntax; git pull; popd

echo Building natives
pushd .vim/bundle/vimproc.vim
make
popd
