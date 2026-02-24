vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchparen = 1
vim.o.encoding = "UTF-8"

vim.opt.updatetime = 50
vim.o.lazyredraw = true
vim.opt.redrawtime = 10000
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0
vim.o.maxmempattern = 20000

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.showmode = false
vim.o.ruler = false
vim.o.winborder = "rounded"
vim.o.guicursor = ""
vim.o.signcolumn = "no"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cmdheight = 1

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("$HOME/.vim/undodir")
vim.o.autoread = true
vim.o.autowrite = false

vim.o.hidden = true
vim.o.modifiable = true
