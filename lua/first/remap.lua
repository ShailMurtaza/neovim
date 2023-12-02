vim.g.mapleader = " "

local function map(mode, key, f)
    vim.keymap.set(mode, key, f, {})
end;

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Telescope
local telescope_builtin = require("telescope.builtin")
map("n", "<leader>f", telescope_builtin.find_files)
-- ############

-- Nvim-Tree
local nvim_tree_api = require("nvim-tree.api")
map("n", "<leader>t", nvim_tree_api.tree.toggle)
-- map("n", "<leader>r", nvim_tree_api.tree.focus)
map("n", "<leader>r", nvim_tree_api.tree.change_root_to_parent)

-- ############
