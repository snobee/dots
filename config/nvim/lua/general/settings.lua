vim.opt.hidden = true               -- Required to keep multiple buffers open multiple buffers
vim.opt.wrap = true                 -- wrap text around the edge of the screen
vim.opt.linebreak = true            -- text will not wrap inside a word
vim.opt.encoding = 'utf-8'          -- The encoding displayed
vim.opt.fileencoding = 'utf-8'      -- The encoding written to file
vim.opt.pumheight = 10              -- Makes popup menu smaller
vim.opt.previewheight = 6           -- Makes preview window smaller
vim.opt.laststatus = 2              -- Always display the status line
vim.opt.showtabline = 1             -- Always show tabs
vim.opt.cmdheight = 1               -- More space for displaying messages
vim.opt.showmode = false            -- don't show the current editing mode
vim.opt.mouse = 'a'                 -- Enable your mouse
vim.opt.splitright = true           -- Vertical splits will automatically be to the right
vim.opt.splitbelow = true           -- Horizontal splits will automatically be below
vim.opt.termguicolors = true        -- Support full 24bit colours
vim.opt.background = 'dark'         -- tell vim what the background colour looks like
vim.opt.expandtab = true            -- Converts tabs to spaces
vim.opt.shiftwidth = 4              -- Change the number of space characters inserted for indentation
vim.opt.smarttab = true             -- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.smartindent = true          -- Makes indenting smart
vim.opt.autoindent = true           -- Good auto indent
vim.opt.tabstop = 4                 -- Tabs equate to 4 spaces
vim.opt.updatetime = 300            -- Faster completion
vim.opt.clipboard = 'unnamedplus'   -- Copy paste between vim and everything else
vim.opt.ruler = true                -- Show the cursor position all the time
vim.opt.signcolumn = 'yes'          -- Always show the sign column, otherwise it would shift the text each time
vim.opt.cursorline = true           -- colours the line your on
vim.opt.nu = true                   -- enable hybrid line numbers
vim.opt.rnu = true                  -- ^^ todo ^^
vim.opt.ignorecase = true           -- searches will be case insensitive
vim.opt.smartcase = true            -- searches will be case insensitive unless uppercases are present
vim.opt.conceallevel = 2            -- allow plugins to represent text with something else
vim.opt.virtualedit = 'all'         -- move the cursor past the EOL
vim.opt.spell = true                -- use spellchecking
vim.opt.sps = 'best,5'              -- show 5 spelling suggestion ordered by 'best'
vim.opt.spelllang = 'en_ca'         -- use Canadian English
vim.opt.timeoutlen = 300            -- timeout for key mappings

-- shorten timeoutlen in insert mode
vim.api.nvim_create_autocmd({'InsertEnter'}, {
    callback = function() vim.opt.timeoutlen = 100 end
})
vim.api.nvim_create_autocmd({'InsertLeave'}, {
    callback = function() vim.opt.timeoutlen = 300 end
})

-- open help in new buffer
vim.api.nvim_create_autocmd({'BufEnter'}, {
    callback = function()
        if vim.o.filetype == 'help' then 
            vim.opt.buflisted = true 
            vim.cmd.only ()
        end
    end
})

-- start shell in interactive mode
local shells = {
    ['/bin/zsh'] = '/usr/bin/env zsh -i', 
    ['/bin/bash'] = '/usr/bin/env bash -i'
}
vim.opt.shell = shells[vim.api.nvim_exec('echo $SHELL', {output=true})]

