local cmp = require'cmp'

local feedkeys = function(str)
    local termcodes = vim.api.nvim_replace_termcodes(str, true, true, true)
    vim.api.nvim_feedkeys(termcodes, 'm', true)
end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<tab>"] = cmp.mapping(function(fallback)
                if vim.fn["UltiSnips#CanJumpForwards"]() == 1 or vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
                    fallback()
                elseif cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    fallback()
                end
            end
        ),
        ["<s-tab>"] = cmp.mapping(function(fallback)
                if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                    fallback()
                elseif cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    fallback()
                end
            end
        ),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
        ['<C-n>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        ),
        ['<C-p>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        ),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'neorg' },
    }, {
        { name = 'buffer' },
    })
})
