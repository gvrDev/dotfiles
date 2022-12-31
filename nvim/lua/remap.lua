--remove without messing clipboard
vim.keymap.set("n", "x", '"_x')

--move page with cursor in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--copy to system clipboard
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--replace all occurrences in file
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

--move selection up and down
vim.keymap.set("v", "K", [[:m '>+1<CR>gv=gv]])
vim.keymap.set("v", "J", [[:m '>-2<CR>gv=gv]])
