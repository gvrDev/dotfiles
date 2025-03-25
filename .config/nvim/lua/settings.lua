vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

local opt = vim.opt
opt.nu = true
opt.relativenumber = true
opt.guicursor = ''

opt.ruler = false
opt.wrap = false
opt.scrolloff = 8
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftround = true
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.undofile = true
opt.swapfile = false
opt.backup = false

opt.updatetime = 50

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true
