" case insensitive sneak
let g:sneak#use_ic_scs = 1

" ; takes you forward , takes you back
let g:sneak#absolute_dir = 1

" Change the colours
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" Cool prompts
let g:sneak#prompt = '🕵'

map df <Plug>Sneak_s
map fd <Plug>Sneak_s
map DF <Plug>Sneak_S
map FD <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
