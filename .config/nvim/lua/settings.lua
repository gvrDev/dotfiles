vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
opt.pumblend = 10
opt.pumheight = 10
