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
            },
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end
}
