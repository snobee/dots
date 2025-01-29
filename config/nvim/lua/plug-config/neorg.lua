-- cannot use lua as buffer cannot be used with pattern
vim.cmd('autocmd FileType norg nmap <buffer> <2-leftmouse> <cr>zz')

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = {'*.norg'},
    command = ':norm gg=G``zz'
})

require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.keybinds"] = {
            config = {
                -- default_keybinds = false,
                hook = function(keybinds)
                    keybinds.remap_event("norg", "i", "<s-cr>", "core.itero.next-iteration")
                    -- keybinds.remap_event("norg", "n", "<cr>", "core.qol.todo_items.todo.task_cycle")
                end
            }
        },
        ["core.concealer"] = {
            config = {
                icon_preset = "varied",
                icons = {
                    todo = {
                        urgent = {
                            icon = '*'
                        },
                    },
                },
            },
        },
        ["core.export"] = {},
        ["core.esupports.metagen"] = {
            config = {
                type = "auto",
            },
        },
        ["core.summary"] = {
            config = {
                timezone = "implicit-local",
            },
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    dnd = "~/drive/dnd/Bad Apples/notes"
                },
            },
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp"
            },
        },
        ["core.integrations.treesitter"] = {},
    },
}
