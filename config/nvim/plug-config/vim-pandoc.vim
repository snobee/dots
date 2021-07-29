let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'python', 'zsh=bash=sh', 'sql', 'rust', 'c', 'cpp', 'java', 'vim']

let g:pandoc#command#autoexec_on_writes = 1
if filereadable("Makefile")
    let g:pandoc#command#autoexec_command = "silent make"
else 
    let g:pandoc#command#autoexec_command = "silent Pandoc -dmarkdown"
endif

