return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                json = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                xml = { "xmlformatter" },
            },
            formatters = {
                xmlformatter = {
                    prepend_args = { "--indent", "4" },
                },
            },
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(args)
                require("conform").format({ bufnr = args.buf, lsp_fallback = true })
            end,
        })
    end
}

