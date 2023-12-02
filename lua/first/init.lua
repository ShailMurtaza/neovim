require("first.remap")
require("first.plugin")
-- require("first.packer")


vim.opt.nu = true
vim.opt.relativenumber = true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 5
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.swapfile = true
vim.opt.backup = true

vim.o.guifont ="Fira Code:h11"

vim.opt.backupdir = "/tmp/nvim/backup"
vim.opt.directory = "/tmp/nvim/swap"

