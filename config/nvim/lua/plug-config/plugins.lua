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
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

-- autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

-- language server
Plug 'neovim/nvim-lspconfig'

-- colorscheme
Plug('sainnhe/gruvbox-material', { branch = 'master' })

-- ranger
-- Plug('kevinhwang91/rnvimr', { branch = 'main' })
Plug 'lambdalisue/vim-fern'

-- sneak
Plug 'justinmk/vim-sneak'

-- show colours
Plug('rrethy/vim-hexokinase', { ['do'] = 'make hexokinase' })

-- centred writing
Plug 'junegunn/goyo.vim'

--.yuck filetype
Plug 'elkowar/yuck.vim'

-- neorg
-- Plug 'nvim-neorg/neorg'
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'nvim-neorg/lua-utils.nvim'
-- Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- wiki.vim
Plug 'lervag/wiki.vim'

-- table mode
Plug 'dhruvasagar/vim-table-mode'
vim.call 'plug#end'
