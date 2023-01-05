local opt = vim.opt
opt.backspace = "start,eol,indent"
opt.guicursor = ""
vim.g.mapleader = " "
opt.updatetime = 50

opt.relativenumber = true

opt.wrap = false
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.scrolloff = 8

opt.backup = false
opt.swapfile = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- opt.colorcolumn = "0"
opt.termguicolors = true
