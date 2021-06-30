" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

nmap <leader>r :RnvimrToggle<CR>

" Fullscreen for initial layout
let g:rnvimr_layout = {
           \ 'relative': 'editor',
           \ 'width': &columns,
           \ 'height': &lines - 2,
           \ 'col': 0,
           \ 'row': 2,
           \ 'style': 'minimal'
           \ }

