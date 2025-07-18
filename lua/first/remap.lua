vim.g.mapleader = " "

local function map(mode, key, f)
    vim.keymap.set(mode, key, f, {})
end;

-- NeoVim
map("i", "<C-v>", "<ESC>\"+pa")
map("n", "<C-c>", "\"+yy")
map("v", "<C-c>", "\"+y")
map("v", "<C-x>", "\"+d")
-- ######

-- Telescope
local telescope_builtin = require("telescope.builtin")
map("n", "<leader>f", telescope_builtin.find_files)
map("n", "<leader>a", telescope_builtin.buffers)
-- ############

-- Nvim-Tree
local nvim_tree_api = require("nvim-tree.api")
map("n", "<leader>t", nvim_tree_api.tree.toggle)
map("n", "<leader>q", nvim_tree_api.tree.focus)
map("n", "<leader>r", nvim_tree_api.tree.change_root_to_parent)
-- ############

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
