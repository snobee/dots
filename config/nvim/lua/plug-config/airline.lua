
vim.cmd('let g:airline#extensions#tabline#enabled = 1')     -- enable tabline             
vim.cmd('let g:airline#extensions#whitespace#enabled = 1')  -- warn on misused whitespace 
vim.g.airline_powerline_fonts = 1                           -- enable powerline
vim.g.airline_theme = 'uwu'                                 -- set theme to uwu (in autoload)
vim.g.airline_detect_spell = 1                              -- detect spellcheck
vim.g.airline_detect_spelllang = 0                          -- don't show language
vim.opt.maxmempattern = 2000
-- vim.cmd([[let g:airline#extensions#coc#enabled = 1]])       -- use coc extension
-- vim.cmd([[let airline#extensions#coc#error_symbol = ':']])
-- vim.cmd([[let airline#extensions#coc#warning_symbol = ':']])
-- create custom symbols
vim.g.airline_symbols = {
    paste = 'ρ',
    whitespace = 'Ξ',
    maxlinenr = 'Ξ ',
    spell = '暈',
    branch = '',
    readonly = '',
    linenr = ' :',
    colnr = ' :',
    dirty='⚡'
}

vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
