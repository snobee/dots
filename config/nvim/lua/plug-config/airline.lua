vim.g['airline#extensions#tabline#enabled'] = 1             -- enable tabline             
vim.g['let g:airline#extensions#whitespace#enabled'] = 1    -- warn on misused whitespace 

vim.g.airline_powerline_fonts = 1                           -- enable powerline
vim.g.airline_theme = 'pastel'                              -- set theme to pastel (in autoload)
vim.g.airline_detect_spell = 1                              -- detect spellcheck
vim.g.airline_detect_spelllang = 0                          -- don't show language
vim.opt.maxmempattern = 2000

-- create custom symbols
vim.g.airline_symbols = {
    paste = 'ρ',
    whitespace = 'Ξ',
    maxlinenr = 'Ξ ',
    spell = '󰓆',
    branch = '',
    readonly = '󰈡',
    linenr = ' :',
    colnr = ' :',
    dirty='⚡'
}

vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
