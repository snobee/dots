let g:airline#extensions#tabline#enabled = 1                " enable tabline
let g:airline#extensions#whitespace#enabled = 1             " warn on misused whitespace
let g:airline_powerline_fonts = 1                           " enable powerline
let g:airline_theme = 'uwu'                                 " set theme to uwu (in autoload)
let g:airline_detect_spell=1                                " detect spellcheck
let g:airline_detect_spelllang=0                            " don't show language
set maxmempattern=2000                                      " throws error while reading regex over 1000 chars

let g:airline#extensions#coc#enabled = 1                    " use coc extension
let airline#extensions#coc#error_symbol = ':'
let airline#extensions#coc#warning_symbol = ':'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}                              " create custom symbols
endif

let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.maxlinenr = 'Ξ '
let g:airline_symbols.spell = '暈'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.dirty='⚡'
