local keymap = vim.keymap

--remove without messing clipboard
keymap.set("n", "x", '"_x')

--move page with cursor in center
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

--copy to system clipboard
keymap.set("v", "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

--replace all occurrences in file
keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

--move selection up and down
keymap.set("v", "J", [[:m '>+1<CR>gv=gv]])
keymap.set("v", "K", [[:m '<-2<CR>gv=gv]])
