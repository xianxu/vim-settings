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

set textwidth=99
set formatoptions=qrn1
set colorcolumn=101

set undofile
set undodir=~/.vim/undodir
set smartindent autoindent
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set hlsearch ruler incsearch showmatch
set isfname-==
set list!
set listchars=tab:▸·,trail:·
" backspace move across line
set backspace=indent,eol,start
set vb t_vb=
set ignorecase smartcase
set mouse=a
set incsearch

" <F1> to toggle paste mode
set pastetoggle=<F1>

nmap  <Leader>f :let @*=expand("%:p")<cr>:echo "Copied file path to clipboard"<cr>

" remap command t keys
nmap <c-t> :CommandT<CR>
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

" what does this do?
"set paste

" yank to system clipboard
set clipboard+=autoselect

" setting spell
set spell spelllang=en_us
" turn spell off by default
set spell!

" toggle display of line number
nmap <leader>l :set number! number?<cr>
" toggle display of whitespaces (tabs etc.)
nmap <leader>w :set list!<cr>
" toggle on and off spelling check
nmap <leader>s :set spell!<cr>

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
map <leader>] :tabn<CR>
map <leader>[ :tabp<CR>

" custom file type and syntax color
augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
  au BufNewFile,BufRead Capfile set filetype=ruby syntax=ruby
  au BufNewFile,BufRead *.thrift set filetype=thrift syntax=thrift
  au BufNewFile,BufRead *.mesos set filetype=python syntax=python
  au BufNewFile,BufRead *BUILD* set filetype=python syntax=python
  au BufNewFile,BufRead *.go set filetype=go syntax=go
  au BufNewFile,BufRead *.sbt set filetype=scala syntax=scala
  au BufRead,BufNewFile README set filetype=mediawiki
  au BufRead,BufNewFile *.ml set filetype=ocaml
  au BufRead,BufNewFile *.proto set filetype=proto
augroup END

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
map <leader>q :bd<CR>
" kill buffer without saving.
map <leader>qq :qall!<CR>
" reload all buffers
map <leader><CR> :bufdo e!<CR>
" deal with space
map <leader><SPACE> :call StripTrailingWhitespace()<CR>

" automatically save views
"au BufWinLeave *.* mkview
"au BufWinEnter *.* silent loadview
" create fold of matching bracket
map <leader>f v%zf
" toggle fold
map <leader>a za

" setting for mac vim
if has("gui_running")
  set guioptions=-t          " remove toolbox from window
  set gfn=Monaco:h13         " default font
  set guioptions+=a          " for macvim to copy on select
  " in gui mode, remap quit to buffer kills
  cnoreabbrev wq w<bar>bd
  cnoreabbrev q bd
  syntax off
endif

" last opened buffer, only works with one history, better than nothing
nmap <c-s-t> :b#<CR>

" quit TagmaBufMgr if it's the last
let g:TagmaBufMgrLastLine = 1
let g:TagmaBufMgrLastWindow = 1

" easier search of tags
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_extensions = ['tag']
let g:ctrlp_cmd = 'CtrlPTag'

