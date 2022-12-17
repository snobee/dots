require 'os'
require 'io'
-- auto-install vim-plug
local f = io.open(os.getenv('HOME') .. '/.config/nvim/autoload/plug.vim')
if f == nil then
    local autoload_file = '~/.config/nvim/autoload/plug.vim'
    local git_source = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    os.execute('curl -fLo ' .. autoload_file .. ' --create-dirs ' .. git_source)
    vim.api.nvim_create_autocmd({'VimEnter'}, {
        callback = function() 
            vim.cmd.PlugInstall()
            vim.cmd.source '$MYVIMRC'
        end
    })
else 
    io.close(f)
end

local Plug = vim.fn['plug#']
-- directory for plugins
vim.fn['plug#begin'] '~/.config/nvim/vim-plug'

-- better statusline
Plug 'vim-airline/vim-airline'

-- compiling latex etc.
Plug 'lervag/vimtex'

-- markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

-- snips plugin for tab completion
Plug 'sirver/ultisnips'

-- Supertab
-- Plug 'ervandew/supertab'

-- autocompletion
-- Plug 'neoclide/coc.nvim', {'branch': 'release'}
-- Plug 'dense-analysis/ale'

-- colorscheme
Plug('sainnhe/gruvbox-material', { branch = 'master' })

-- ranger
Plug('kevinhwang91/rnvimr', { branch = 'main' })

-- sneak
Plug 'justinmk/vim-sneak'

-- show colours
Plug('rrethy/vim-hexokinase', { ['do'] = 'make hexokinase' })

-- centred writing
Plug 'junegunn/goyo.vim'

--.yuck filetype
Plug 'elkowar/yuck.vim'
vim.call 'plug#end'
