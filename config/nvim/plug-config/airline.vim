let g:airline#extensions#tabline#enabled = 1                " enable tabline
let g:airline#extensions#whitespace#mixed_indent_algo = 2   " dont warn about spaces after tabs
let g:airline_theme = 'uwu'                                 " set theme to uwu (in my autoload)
let g:airline_powerline_fonts = 1                           " enable powerline fonts
set maxmempattern=2000                                      "throws error while reading regex over 1000 chars

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.maxlinenr = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.colnr = ' :' 
let g:airline_symbols.dirty='⚡'
