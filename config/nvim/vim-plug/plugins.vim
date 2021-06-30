" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/vim-plug')   " directory for plugins
    " better statusline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " compiling latex etc.   
    Plug 'lervag/vimtex'

    " snips plugin for tab completion
    Plug 'sirver/ultisnips'      

    " Supertab
    Plug 'ervandew/supertab'

    " autocompletion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'ycm-core/YouCompleteMe'

    " colorscheme
    Plug 'sainnhe/gruvbox-material', { 'branch': 'master' }

    " ranger
    Plug 'kevinhwang91/rnvimr', { 'branch': 'main' }

    " sneak
    Plug 'justinmk/vim-sneak'

    " show colours
    Plug 'gko/vim-coloresque'
call plug#end()
