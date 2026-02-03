-- Mapleader
vim.g.mapleader = ' '

-- Colors
vim.opt.termguicolors = true

-- tabsize
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Line Wrap
vim.opt.wrap = false

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Line Numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Other
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.smartindent = true

-- Disabling Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Tabline
vim.opt.showtabline = 1

-- remove indicators above statusline
vim.opt.showmode = false

vim.opt.diffopt = "vertical"
