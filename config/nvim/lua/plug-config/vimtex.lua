vim.g.tex_flavor = 'latex'                -- use latex
vim.g.vimtex_view_method = 'zathura'      -- open in Zathura
vim.g.vimtex_quickfix_mode = 2            -- open window for errors
vim.g.vimtex_quickfix_open_on_warning = 0 -- don't open for warnings
vim.g.vimtex_view_automatic = 0           -- needed for Wayland

-- compile on start
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'tex',
    callback = function()
        vim.cmd'VimtexCompile'
        vim.cmd 'VimtexView' 
        vim.api.nvim_set_keymap('n', '<leader>', ':noh<cr><plug>(vimtex-view)', {silent = true})
    end
})
