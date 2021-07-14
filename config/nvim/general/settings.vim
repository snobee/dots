filetype indent plugin on
syntax on                               " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set wrap                                " wrap text around the edge of the screen
set linebreak                           " text will not wrap inside a word
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file
set pumheight=10                        " Makes popup menu smaller
set previewheight=6                     " Makes preview window smaller
set laststatus=2                        " Always display the status line
set showtabline=1                       " Always show tabs
set cmdheight=1                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitright                          " Vertical splits will automatically be to the right
set splitbelow                          " Horizontal splits will automatically be below
set t_Co=256                            " Support 256 colors
set termguicolors                       " Support full 24bit colours
set background=dark                     " tell vim what the background color looks like
set expandtab                           " Converts tabs to spaces
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set tabstop=4                           " Tabs equate to 4 spaces
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set updatetime=300                      " Faster completion
set clipboard=unnamedplus               " Copy paste between vim and everything else
set ruler                               " Show the cursor position all the time
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set cursorline                          " colours the line your on
set nu rnu                              " enable hybrid line numbers
set ignorecase                          " searches will be case insensitive
set smartcase                           " searches will be case insensitive unless uppercases are present
set conceallevel=2                      " allow plugins to represent text with something else
set virtualedit=all                     " move the cursor past the EOL

let &shell=get({
    \ '/bin/zsh':  '/usr/bin/env zsh -i',
    \ '/bin/bash': '/usr/bin/env bash -i'},
    \ $SHELL, '/usr/bin/env/bash -i')   " start shell in interactive mode

" open help in new buffer
au BufEnter * if &filetype == 'help' | :set buflisted | :only | endif
