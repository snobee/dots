" Color palette taken from vim-airline-themes/bubblegum
let s:gui_dark_gray = '#303030'
let s:cterm_dark_gray = 236
let s:gui_med_gray_hi = '#444444'
let s:cterm_med_gray_hi = 238
let s:gui_med_gray_lo = '#3a3a3a'
let s:cterm_med_gray_lo = 237
let s:gui_light_gray = '#b2b2b2'
let s:cterm_light_gray = 249
let s:gui_green = '#afd787'
let s:cterm_green = 150
let s:gui_blue = '#87afd7'
let s:cterm_blue = 110
let s:gui_purple = '#afafd7'
let s:cterm_purple = 146
let s:gui_orange = '#d7af5f'
let s:cterm_orange = 179
let s:gui_red = '#d78787'
let s:cterm_red = 174
let s:gui_pink = '#d7afd7'
let s:cterm_pink = 182

let g:airline#themes#uwu#palette = {}

" Error/Warning
let s:E1 = [s:gui_dark_gray, s:gui_red, s:cterm_dark_gray, s:cterm_red]

" Normal mode
let s:N1 = [s:gui_dark_gray, s:gui_green, s:cterm_dark_gray, s:cterm_green]
let s:N2 = [s:gui_light_gray, s:gui_med_gray_lo, s:cterm_light_gray, s:cterm_med_gray_lo]
let s:N3 = [s:gui_green, s:gui_med_gray_hi, s:cterm_green, s:cterm_med_gray_hi]
let g:airline#themes#uwu#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
call extend(g:airline#themes#uwu#palette.normal, {
    \ 'airline_warning':    s:E1,
    \ 'airline_error':      s:E1,
    \ })
let g:airline#themes#uwu#palette.normal_modified = {
    \ 'airline_c': [s:gui_orange, s:gui_med_gray_hi, s:cterm_orange, s:cterm_med_gray_hi, ''],
    \ 'airline_warning':    s:E1,
    \ 'airline_error':      s:E1,
    \ }

" Insert mode
let s:I1 = [s:gui_med_gray_hi, s:gui_blue, s:cterm_med_gray_hi, s:cterm_blue]
let s:I2 = s:N2
let s:I3 = [s:gui_blue, s:gui_med_gray_hi, s:cterm_blue, s:cterm_med_gray_hi]
let g:airline#themes#uwu#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
call extend(g:airline#themes#uwu#palette.insert, {
    \ 'airline_warning':    s:E1,
    \ 'airline_error':      s:E1,
    \ })
let g:airline#themes#uwu#palette.insert_modified = copy(g:airline#themes#uwu#palette.normal_modified)
let g:airline#themes#uwu#palette.insert_paste = {
    \ 'airline_a': [s:gui_dark_gray, s:gui_orange, s:cterm_dark_gray, s:cterm_orange, ''],
    \ 'airline_warning':    s:E1,
    \ 'airline_error':      s:E1,
    \ }

" Replace mode
let s:R1 = s:E1
let s:R2 = s:N2
let s:R3 = [s:gui_red, s:gui_med_gray_hi, s:cterm_red, s:cterm_med_gray_hi]
let g:airline#themes#uwu#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
call extend(g:airline#themes#uwu#palette.replace, {
    \ 'airline_warning':    s:E1,
    \ 'airline_error':      s:E1,
    \})
let g:airline#themes#uwu#palette.replace_modified = copy(g:airline#themes#uwu#palette.insert_modified)

" Visual mode
let s:V1 = [s:gui_dark_gray, s:gui_pink, s:cterm_dark_gray, s:cterm_pink]
let s:V2 = s:N2
let s:V3 = [s:gui_pink, s:gui_med_gray_hi, s:cterm_pink, s:cterm_med_gray_hi]
let g:airline#themes#uwu#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:V3)
call extend(g:airline#themes#uwu#palette.visual, {
    \ 'airline_warning':    s:E1,
    \ 'airline_error':      s:E1,
    \})
let g:airline#themes#uwu#palette.visual_modified = copy(g:airline#themes#uwu#palette.insert_modified)

" Inactive window
let s:IA = [s:gui_light_gray, s:gui_med_gray_hi, s:cterm_light_gray, s:cterm_med_gray_hi, '']
let g:airline#themes#uwu#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#uwu#palette.inactive_modified = {
    \ 'airline_c': [s:gui_orange, '', s:cterm_orange, '', ''],
    \ 'airline_warning':    s:E1,
    \ 'airline_error':      s:E1,
    \ }

" CtrlP
if get(g:, 'loaded_ctrlp', 0)
    let g:airline#themes#uwu#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        \ [ s:gui_orange, s:gui_med_gray_hi, s:cterm_orange, s:cterm_med_gray_hi, '' ] ,
        \ [ s:gui_orange, s:gui_med_gray_lo, s:cterm_orange, s:cterm_med_gray_lo, '' ] ,
        \ [ s:gui_dark_gray, s:gui_green, s:cterm_dark_gray, s:cterm_green, 'bold' ] )
endif

if g:airline#extensions#tabline#enabled
    let s:T1 = [s:gui_dark_gray, s:gui_purple, s:cterm_dark_gray, s:cterm_purple]
    let s:T3 = [s:gui_purple, s:gui_med_gray_hi, s:cterm_purple, s:cterm_med_gray_hi]
    call extend(g:airline#themes#uwu#palette.normal, {
        \ 'airline_tab':            s:N3,
        \ 'airline_tab_right':      s:N3,
        \ 'airline_tabsel':         s:N1,
        \ 'airline_tabsel_right':   s:N1,
        \ 'airline_tabmod':         s:T1,
        \ 'airline_tabmod_right':   s:T1,
        \ 'airline_tabmod_unsel':   s:T3,
        \ 'airline_tabtype':        s:N2,
        \ 'airline_tabfill':        s:N2,
        \ 'airline_tablabel':       s:T3,
        \ 'airline_tablabel_right': s:T3,
        \ 'airline_tabhid':         s:N3,
        \ 'airline_tabhid_right':   s:N3,
        \}
        \)
    " airline_tab:		        default highlighting group for the tabline
    " airline_tab_right:	    idem, but for the right side of the tabline
    " airline_tabsel:	        highlighting group of the selected item
    " airline_tabsel_right:     idem, but for the right side of the tabline
    " airline_tabmod:           highlighting group for a 'modified' buffer
    " airline_tabmod_right:     idem, but on the right side
    " airline_tabmod_unsel:     unselected tab with modified buffer
    " airline_tabtype:          label group used by ctrlspace and tabws
    " airline_tabfill:	        highlighting group for the filler space
    " airline_tablabel:         highlighting group for the label
    " airline_tablabel_right:   highlighting group for the label on the right side
    " airline_tabhid:	        hidden buffer
    " airline_tabhid_right:     idem, but on the right
endif
