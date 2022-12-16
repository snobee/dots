
keymap = vim.api.nvim_set_keymap
noremap = {noremap = true}
silent = {silent = true}
silentnoremap = {silent = true, noremap = true}

-- map leader to <space> (only possible as there are no imap <leader> commands
vim.cmd 'let mapleader = " "'
keymap('x', '<leader>', '<nop>', noremap)

-- exit visual with return
keymap('x', '<cr>', '<esc>', noremap)
-- exit visual with j+k
for _, map in ipairs {'jk', 'kj', 'Jk', 'KJ'} do
    keymap('i', map, '<esc>', noremap)
end
-- escape terminal with <esc>
keymap('t', '<esc>', '<c-\\><c-n>', noremap)

-- move through soft wrapped lines
for _, mode in ipairs {'v', 'n'} do
    keymap(mode, '<up>', 'gk', silent)
    keymap(mode, 'k', 'gk', silent)
    keymap(mode, '<down>', 'gj', silent)
    keymap(mode, 'j', 'gj', silent)
end
keymap('i', '<up>', '<c-o>gk', silent)
keymap('i', '<down>', '<c-o>gj', silent)

-- correct last spelling mistake
keymap('n', '<leader><leader>', '[s1z=`]', noremap)
-- jump to last spelling mistake and start correction
keymap('n', '<leader>z', '[sz=', noremap)

-- save with <leader>s
keymap('n', '<leader>s', ':w<cr>', silentnoremap)
-- use <tab>/<s-tab> to switch buffers
keymap('n', '<tab>', ':bn<cr>', silentnoremap)
keymap('n', '<s-tab>', ':bp<cr>', silentnoremap)
-- close buffer with <leader>q
keymap('n', '<leader>q', ':bd<cr>', silentnoremap)

-- <esc> to remove highlighting
keymap('n', '<esc>', ':noh<cr>', silentnoremap)
-- Y to copy to the end of the line
keymap('n', 'Y', 'y$', {})
-- unindent with <s-tab>
keymap('i', '<s-tab>', '<c-d>', {})
-- visual tab in and out
keymap('x', '>', '>gv', {})
keymap('x', '<', '<gv', {})

vim.cmd([[
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
]])

-- add blank lines above/below with <leader>O/<leader>o
for _, key in ipairs {'O', 'o'} do
    keymap('n', key, key .. '<esc>', noremap)
end
-- insert a single char with <leader>i/<leader>a
-- insert a single character at the beginning/end with <leader>I/<leader>A
for _, key in ipairs {'i', 'a', 'I', 'A'} do
    keymap('n', '<leader>' .. key, key .. '?<esc>r', noremap)
end
-- insert a single character before/after selection with <leader>i/<leader>a
keymap('x', '<leader>i', '<esc>`<<c-v>`>I?<esc>`[<c-v>`]hr', noremap)
keymap('x', '<leader>a', '<esc>`<<c-v>`>A?<esc>`[<c-v>`]hr', noremap)
-- insert a single character at the start/end of the selected lines with <leader>I/<leader>A
-- known bugs: the end of the selected line is only calculated at the top and bottom of selection
keymap('x', '<leader>I', '0o0<leader>i', {})
keymap('x', '<leader>A', '$o$<leader>a', {})

-- commenting blocks of code
function set_comment(leader, filetypes)
    vim.api.nvim_create_autocmd({'FileType'}, {
        pattern = filetypes,
        callback = function() vim.b.comment_leader = leader end
    })
end
set_comment('//', {'c', 'h', 'cpp', 'hpp', 'java', 'scala', 'rust'})
set_comment('#', {'sh', 'ruby', 'python', 'conf', 'fstab', 'yaml'})
set_comment('%', {'tex'})
set_comment('"', {'vim'})
set_comment('--', {'sql', 'lua'})

keymap('x',
    '<leader>/',
    [[":norm I" . b:comment_leader . " <cr>"]],
    {silent = true, noremap = true, expr = true}
)
keymap('x',
    '<leader>?',
    [[":s/" . escape(b:comment_leader, '\/') . " *//e<cr>:noh<cr>"]],
    {silent = true, noremap = true, expr = true}
)
keymap('n',
    '<leader>/',
    [["I" . b:comment_leader . " <esc>"]],
    {silent = true, noremap = true, expr = true}
)
keymap('n',
    '<leader>?',
    [[":s/" . escape(b:comment_leader, '\/') . " *//e<cr>:noh<cr>"]],
    {silent = true, noremap = true, expr = true}
)
