return {
    "neovim/nvim-lspconfig", -- Basic configs for different language servers

    dependencies = {
        "williamboman/mason.nvim", -- Manager for language servers, linters etc
        "williamboman/mason-lspconfig.nvim", -- Manage installed LSP servers
        "hrsh7th/nvim-cmp", -- Completion engine. Alternative to builtin omnifunc
        "hrsh7th/cmp-nvim-lsp", -- LSP completion
        "hrsh7th/cmp-buffer", -- Current Buffer Completion. Used for searching
        "hrsh7th/cmp-path", -- Source for Filesystem paths. Used to autocomplete files path
        "hrsh7th/cmp-cmdline", -- Neovim command line completion
        "L3MON4D3/LuaSnip", -- Provides snippets functionality
        "saadparwaiz1/cmp_luasnip", -- Used to autocompelete snippets
    },
    config = function()

        local cmp = require('cmp')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require("mason").setup()
        require("mason-lspconfig").setup({
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = {
                    border = 'rounded', -- or 'single', 'double', 'shadow', 'none'
                    winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
                    scrollbar = true,
                },
                documentation = {
                    border = 'rounded',
                    winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
                },
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<S-CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })
        -- For command line completion
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'path' },
                { name = 'cmdline' }
            }
        })

        -- For `/` and `?` searches
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show diagnostic message" })
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })
    end
}


