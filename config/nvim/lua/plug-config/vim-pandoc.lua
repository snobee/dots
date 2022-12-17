vim.g.markdown_fenced_languages = {'html', 'css', 'javascript', 'python', 'zsh=bash=sh', 'sql', 'rust', 'c', 'cpp', 'java', 'vim'}

vim.g['pandoc#command#autoexec_on_writes'] = 1
local f = io.open('Makefile')
vim.cmd([[
if filereadable("Makefile")
    let g:pandoc#command#autoexec_command = "silent make"
else 
    let g:pandoc#command#autoexec_command = "silent Pandoc -dmarkdown"
endif
]])
