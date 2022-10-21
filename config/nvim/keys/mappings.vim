let mapleader = " "                                 " map leader to Space (only possible as there are no imap <leader> commands

xnoremap <cr> <esc>|                                " exit visual with return
inoremap jk <esc>|                                  " exit insert mode with j+k
inoremap kj <esc>
inoremap JK <esc>|                                  " or K+J
inoremap KJ <esc>
tnoremap <Esc> <C-\><C-n>                           " escape terminal with <esc>

vmap <silent> <Up> gk|                              " move through soft wrapped lines
vmap <silent> k gk
vmap <silent> <Down> gj
vmap <silent> j gj
nmap <silent> <Up> gk
nmap <silent> k gk
nmap <silent> <Down> gj
nmap <silent> j gj
imap <silent> <Up> <C-o>gk
imap <silent> <Down> <C-o>gj

nnoremap <leader><leader> [s1z=`]|                  " correct last spelling mistake
nnoremap <leader>z [sz|                             " jump to last spelling mistake and start correction

nnoremap <silent> <leader>s :w<cr>|                 " different saving yay
nnoremap <silent> <tab> :bn<cr>|                    " tab/TAB in normal to switch buffers
nnoremap <silent> <s-tab> :bp<cr>
nnoremap <silent> <c-q> :bd<cr>|                    " close buffer with ctrl+q

nnoremap <silent> <leader> :noh<cr>|                " remove highlighting
nnoremap Y y$|                                      " yank to the end of line
inoremap <s-tab> <c-d>|                             " unindent with shift+tab
xnoremap > >gv|                                     " tab right
xnoremap < <gv|                                     " tab left

" move selection up and down
let move_up   = "\<esc>`>\<c-v>`<maomdOmc\"aygv`akoky`dv`cp`d\<c-v>`akok\"apgv"
let move_down = "\<esc>`<\<c-v>`>mdomaOmb\"aygv`djojy`av`bp`a\<c-v>`djoj\"apgv"
vnoremap <silent> <expr> <c-j> mode()==?'v' ? ":m '>+1<cr>gv" : move_down
vnoremap <silent> <expr> <c-k> mode()==?'v' ? ":m '<-2<cr>gv" : move_up
nnoremap <silent> <c-j> :m .+1<cr>|                 " move lines up and down
nnoremap <silent> <c-k> :m .-2<cr>
vnoremap <c-l> lholhxp`[1v|                         " move selection left and right
vnoremap <c-h> hlohlxhP`[1v
nnoremap <c-l> lhxp|                                " move character left and right
nnoremap <c-h> hlxhP

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
