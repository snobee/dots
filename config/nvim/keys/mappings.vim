let mapleader = " "                                 " map leader to Space (only possible as there are no imap <leader> commands

xnoremap <cr> <esc>|                                " exit visual with return
inoremap lk <esc>|                                  " exit insert mode with k+l
inoremap kl <esc>
inoremap LK <esc>|                                  " or K+L
inoremap KL <esc>

nnoremap <silent> <leader>s :w<cr>|                 " different saving yay
nnoremap <silent> <tab> :bn<cr>|                    " tab/TAB in normal to switch buffers
nnoremap <silent> <s-tab> :bp<cr>
nnoremap <silent> <c-q> :bd<cr>|                    " close buffer with ctrl+q
nnoremap <c-o> <c-w><c-o>|                          " remove other windows from tab with ctrl+o
nnoremap <c-h> <c-w>h|                              " Better window navigation with ctrl+direction
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <silent> <leader> :noh<cr>|                " remove highlighting
nnoremap Y y$|                                      " yank to the end of line
inoremap <s-tab> <c-d>|                             " unindent with shift+tab
xnoremap > >gv|                                     " tab right
xnoremap < <gv|                                     " tab left
inoremap <c-t> <esc>viw~ea|                         " Easy toggle caps with ctrl-t
nnoremap <c-t> viw~e

nnoremap <silent> J :move +1<cr>|                   " move lines up and down
nnoremap <silent> K :move -2<cr>
xnoremap <silent> J :move +2<cr>gv=gv
xnoremap <silent> K :move -2<cr>gv=gv
nnoremap L lhxp|                                    " move selection left and right (its a bit slow)
nnoremap H hlxhP
xnoremap L lholhxp`[1v
xnoremap H hlohlxhP`[1v

nnoremap <leader>O O<esc>|                          " add blank line above
nnoremap <leader>o o<esc>|                          " add blank line below
nnoremap <leader>i i?<esc>r|                        " instert a single char with leader+i/a
nnoremap <leader>a a?<esc>r
nnoremap <leader>I I?<esc>r|                        " insert a single char at the beginning or end
nnoremap <leader>A A?<esc>r
xnoremap <leader> <nop>|                            " necessary for <leader> as space
xnoremap <leader>i <esc>`<<c-v>`>I?<esc>`[<c-v>`]hr|" insert a single char before selection
xnoremap <leader>a <esc>`<<c-v>`>A?<esc>`[<c-v>`]hr|" insert a single char after selection
xmap     <leader>I 0o0<leader>i|                    " insert a single char at the start of the lines
xmap     <leader>A $o$<leader>a|                    " insert a single char on the selection at the end of either the current line or other end of the selection

" commenting_blocks_of_code
let b:comment_leader='# '
augroup commenting_blocks_of_code
    autocmd!
    autocmd FileType c,h,cpp,hpp,java,scala,rust    let b:comment_leader = '// '
    autocmd FileType sh,ruby,python                 let b:comment_leader = '# '
    autocmd FileType conf,fstab,yaml                let b:comment_leader = '# '
    autocmd FileType tex                            let b:comment_leader = '% '
    autocmd FileType vim                            let b:comment_leader = '" '
    autocmd FileType sql                            let b:comment_leader = '--'
augroup END
xnoremap <silent> <expr> <leader>/ ":norm I" . b:comment_leader . "<cr>"
xnoremap <silent> <expr> <leader>? ":s/" . escape(b:comment_leader, '\/') . "//e<cr>:noh<cr>"
nnoremap <silent> <expr> <leader>/ "I" . b:comment_leader . "<esc>"
nnoremap <silent> <expr> <leader>? ":s/" . escape(b:comment_leader, '\/') . "//e<cr>:noh<cr>"
