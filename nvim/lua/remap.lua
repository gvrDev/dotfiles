vim.keymap.set('n',"x", '"_x')

vim.keymap.set('n',"<C-d>", "<C-d>zz")
vim.keymap.set('n',"<C-u>", "<C-u>zz")

vim.keymap.set('n',"n", "nzzzv")
vim.keymap.set('n',"N", "Nzzzv")

vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
