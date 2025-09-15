return {
    "windwp/nvim-autopairs",
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true,  -- Optional: enable smarter pairing with treesitter
        })
    end
}
