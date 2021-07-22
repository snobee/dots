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

    " compiling latex etc.
    Plug 'lervag/vimtex'

    " markdown
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'

    " snips plugin for tab completion
    Plug 'sirver/ultisnips'

    " Supertab
    Plug 'ervandew/supertab'

    " autocompletion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " colorscheme
    Plug 'sainnhe/gruvbox-material', { 'branch': 'master' }

    " ranger
    Plug 'kevinhwang91/rnvimr', { 'branch': 'main' }

    " sneak
    Plug 'justinmk/vim-sneak'

    " show colours
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

    " centred writing
    Plug 'junegunn/goyo.vim'
call plug#end()
