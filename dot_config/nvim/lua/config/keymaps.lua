vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "|", "<cmd>vsplit<CR>", { silent = true })

vim.keymap.set("n", "U", vim.cmd.redo, { silent = true })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { silent = true })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { silent = true })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "g_")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("v", "<leader>d", [["_d]])
vim.keymap.set("n", "x", [["_x]])
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", ";;", ":!<UP>")

vim.keymap.set("n", "J", "mzJ`z")
