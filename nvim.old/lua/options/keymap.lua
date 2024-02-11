local keymap = vim.keymap
keymap.set("n", "x", '"_x')

keymap.set("n", "U", "<cmd>redo<cr>", { desc = "redo" })

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "N", "nzzzv")
keymap.set("n", "n", "Nzzzv")

keymap.set("v", "<leader>y", [["+y]], { desc = "yank selection to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "yank line to system clipboard" })

keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "kill current buffer" })
