vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "|", "<cmd>vsplit<CR>", { silent = true, desc = "Window: Split vertically" })

vim.keymap.set("n", "U", vim.cmd.redo, { silent = true, desc = "Edit: Redo change" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { silent = true, desc = "Diagnostics: Go to next message" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { silent = true, desc = "Diagnostics: Go to previous message" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Window: Focus left split" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Window: Focus right split" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Window: Focus lower split" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Window: Focus upper split" })

vim.keymap.set("n", "H", "^", { desc = "Motion: Go to line start" })
vim.keymap.set("n", "L", "g_", { desc = "Motion: Go to line end" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Motion: Scroll down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Motion: Scroll up and center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search: Go to previous match and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Search: Go to next match and center" })

vim.keymap.set({ "n", "v", "x" }, "<leader>y", [["+y]], { desc = "Clipboard: Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Clipboard: Copy line to system clipboard" })
vim.keymap.set("n", "x", [["_x]], { desc = "Edit: Delete character without yanking" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Clipboard: Paste without overwriting yank register" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent: Decrease and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent: Increase and keep selection" })

vim.keymap.set("n", ";;", ":!<UP>", { desc = "Shell: Run previous shell command" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Edit: Join line below" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Search: Clear highlights" })
