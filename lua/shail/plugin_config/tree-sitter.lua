return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "json",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            }
        }
    end
}

