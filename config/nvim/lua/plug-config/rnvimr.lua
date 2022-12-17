-- Make Ranger replace netrw and be the file explorer
vim.g.rnvimr_ex_enable = 1

-- <leader>r to show ranger
vim.api.nvim_set_keymap('n', '<leader>r', ':RnvimrToggle<CR>', {})

-- Fullscreen for initial layout
vim.cmd([[
let g:rnvimr_layout = {
           \ 'relative': 'editor',
           \ 'width': &columns,
           \ 'height': &lines - 2,
           \ 'col': 0,
           \ 'row': 2,
           \ 'style': 'minimal'
           \ }
]])
