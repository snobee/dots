let g:tex_flavor='latex'                " use latex
let g:vimtex_view_method='zathura'      " open in Zathura
let g:vimtex_quickfix_mode=2            " open window for errors
let g:vimtex_quickfix_open_on_warning=0 " don't open for warnings
let g:vimtex_view_automatic=0           " needed for Wayland

"compile on start
autocmd FileType tex VimtexView
autocmd FileType tex VimtexCompile
autocmd FileType tex nmap <silent> <leader> :noh<cr><plug>(vimtex-view)
