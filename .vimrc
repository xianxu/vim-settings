filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible
set modelines=0

syntax on

set t_Co=256
if &diff
  set wrap
  colors mayansmoke
else
  colorscheme summerfruit256
end

" config vim-airline
set laststatus=2
let g:airline_theme='light'

set textwidth=99
set formatoptions=qrn1
set colorcolumn=101

set undofile
set undodir=~/.vim/undodir
set smartindent autoindent
set hlsearch ruler incsearch showmatch
set isfname-==
" backspace move across line
set backspace=indent,eol,start
set vb t_vb=
set ignorecase smartcase
set mouse=a
set incsearch

" <F1> to toggle paste mode
set pastetoggle=<F1>

nnoremap <Leader>FF :let @*=expand("%:p")<cr>:echo "Copied file path to clipboard"<cr>
nnoremap <Leader>F :let @*=expand("%:t")<cr>:echo "Copied file name to clipboard"<cr>

" remap command t keys
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

" yank to system clipboard
"set clipboard+=unnamedplus   " have this on remote machine.
set clipboard+=autoselect

" setting spell
set spell spelllang=en_us
" turn spell off by default
set spell!

" toggle display of line number
nnoremap <leader>l :set number! number?<cr>
" toggle display of whitespaces (tabs etc.)
nnoremap <leader>w :set list!<cr>
" sort
vnoremap <leader>s :sort<cr>

" correct color for spell check.
hi SpellLocal ctermbg=lightcyan

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

set wildignore+=*.pex,*.o,*.obj,.git,.svm,*.class,*.jar,lib_managed,src_managed,target,dist,*.ico,*.png,*.jpg,*.jpeg,novim*,*.bz2,*.gz,*.tar,*.zip,3rdparty,*.lock,*.pyc

" dealing with tabs
nnoremap <leader>] :tabn<CR>
nnoremap <leader>[ :tabp<CR>

" custom file type and syntax color
augroup filetypedetect
  au BufNewFile,BufRead *.rs set filetype=rust syntax=rust
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
  au BufNewFile,BufRead Capfile set filetype=ruby syntax=ruby
  au BufNewFile,BufRead *.thrift set filetype=thrift syntax=thrift
  au BufNewFile,BufRead *.mesos set filetype=python syntax=python
  au BufNewFile,BufRead *BUILD* set filetype=python syntax=python
  au BufNewFile,BufRead *.go set filetype=go syntax=go
  au BufNewFile,BufRead *.sbt set filetype=scala syntax=scala
  au BufNewFile,BufRead *.js set filetype=javascript syntax=javascript
  au BufRead,BufNewFile README set filetype=mediawiki
  au BufRead,BufNewFile *.ml set filetype=ocaml
  au BufRead,BufNewFile *.proto set filetype=proto
augroup END

autocmd FileType haskell setlocal expandtab list! tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType scala setlocal expandtab list! tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType java setlocal expandtab list! tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal expandtab list! tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType js setlocal expandtab list! tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType haskell setlocal listchars=tab:▸·,trail:·
autocmd FileType scala setlocal listchars=tab:▸·,trail:·
autocmd FileType java setlocal listchars=tab:▸·,trail:·
autocmd FileType ruby setlocal listchars=tab:▸·,trail:·
autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Remove trailing whitespace from code files on save
function! StripTrailingWhitespace()
  " store current cursor location
  silent exe "normal ma<CR>"
  " store the current search value
  let saved_search = @/

  " delete the whitespace (e means don't warn if pattern not found)
  %s/\s\+$//e
  %s/^\t/  /e
  %s/^  \t/    /e
  %s/^    \t/      /e
  %s/^      \t/        /e
  %s/^        \t/          /e
  %s/^          \t/            /e
  %s/^            \t/              /e
  %s/^              \t/                /e
  %s/^                \t/                  /e
  %s/^                  \t/                    /e
  %s/^                    \t/                      /e
  %s/^                      \t/                        /e
  %s/^                        \t/                          /e
  %s/^                          \t/                            /e

  " restore old cursor location
  silent exe "normal `a<CR>"
  " restore the search value
  let @/ = saved_search
endfunction

"*.scala,*.c,*.h,*.hpp,*.cc,*.cpp,*.py,*.sh,*.tex
"autocmd BufWritePre * call StripTrailingWhitespace()

" start neocomplete, this allows you to complete with tokens in this file.
let g:neocomplcache_enable_at_startup = 1
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" map leader q to bd
noremap <leader>q :bd<CR>
" kill buffer without saving.
noremap <leader>qq :qall!<CR>
" reload all buffers
noremap <leader><CR> :bufdo e!<CR>
" deal with space
noremap <leader><SPACE> :call StripTrailingWhitespace()<CR>

" automatically save views
"au BufWinLeave *.* mkview
"au BufWinEnter *.* silent loadview
" create fold of matching bracket
noremap <leader>f v%zf
" toggle fold
noremap <leader>a za

" setting for mac vim
if has("gui_running")
  set guioptions=-t          " remove toolbox from window
  set gfn=Inconsolata-dz:h15    " default font
  set guioptions+=a          " for macvim to copy on select
  " in gui mode, remap quit to buffer kills
  cnoreabbrev wq w<bar>bd
  cnoreabbrev q bd
  "syntax off
endif

" last opened buffer, only works with one history, better than nothing
nnoremap <c-s-t> :b#<CR>

" quit TagmaBufMgr if it's the last
"let g:TagmaBufMgrLastLine = 1
"let g:TagmaBufMgrLastWindow = 1

" easier search of tags
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_extensions = ['tag']
let g:ctrlp_cmd = 'CtrlPTag'

" shortcuts to load .vimrc and source it
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" some ascii art stuff
vnoremap <leader>vd ma"aygvoOl:s/\%V.\%V/ /g<cr>:nohlsearch<cr>`a
vnoremap <leader>vc ma"aygvoOly<cr>:nohlsearch<cr>`a
vnoremap <leader>vb maoOl:s/\%V.\%V/\|/g<cr>:nohlsearch<cr>`a
vnoremap <leader>v<space> maoOl:s/\%V.\%V/\-/g<cr>:nohlsearch<cr>`a
noremap <leader>vp ma1vh"apgvly<esc>`a

" comment and copy
vnoremap <leader>C yPgv:call NERDComment(1, 'sexy')<cr>

function! RightAlignVisual() range
    let [l, r] = [virtcol("'<"), virtcol("'>")]
    let [l, r] = [min([l, r]), max([l, r])]
    exe "'<,'>" 's/\%'.l.'v.*\%<'.(r+1).'v./\=StrPadLeft(submatch(0),r-l+1)'
endfunction
function! StrPadLeft(s, w)
    let s = substitute(a:s, '^\s\+\|\s\+$', '', 'g')
    return repeat(' ', a:w - strwidth(s)) . s
endfunction
vnoremap <leader>vr :call RightAlignVisual()<cr>

" xiki
"let $XIKI_DIR = '/usr/local/rvm/gems/ree-1.8.7-2011.03@twitter/gems/xiki-0.6.3/'
"source /usr/local/rvm/gems/ree-1.8.7-2011.03@twitter/gems/xiki-0.6.3/etc/vim/xiki.vim
