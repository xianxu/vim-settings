setlocal omnifunc=necoghc#omnifunc

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'haskell'],
                           \ 'passive_filetypes': ['scala', 'java'] }
let g:necoghc_enable_detailed_browse = 1
hi ghcmodType ctermbg=lightcyan
let g:ghcmod_type_highlight = 'ghcmodType'
nnoremap <Leader>f :GhcModType<cr>
nnoremap <Leader>e :GhcModExpand<cr>

