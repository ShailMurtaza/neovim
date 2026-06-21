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
local file_ignore_patterns = {
    "yarn%.lock",
    "node_modules/",
    "raycast/",
    "dist/",
    "%.next",
    "%.git/",
    "%.gitlab/",
    "build/",
    "target/",
    "package%-lock%.json",
}
local telescope_builtin = require("telescope.builtin")
map("n", "<leader>f", function()
    telescope_builtin.find_files({
        file_ignore_patterns = file_ignore_patterns,
    })
end)

map("n", "<leader>a", telescope_builtin.buffers)
-- ############

-- Nvim-Tree
local nvim_tree_api = require("nvim-tree.api")
map("n", "<leader>t", nvim_tree_api.tree.toggle)
map("n", "<leader>q", nvim_tree_api.tree.focus)
map("n", "<leader>r", nvim_tree_api.tree.change_root_to_parent)
-- ############
