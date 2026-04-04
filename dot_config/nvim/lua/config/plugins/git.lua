-- SETUP --
require("octo").setup({
	picker = "fzf-lua",
})
require("mini.diff").setup({
	view = {
		style = "number",
	},
})
----

-- Keymaps --
vim.keymap.set("n", "<leader>gg", "<CMD>Git<CR>", { silent = true, desc = "Git: Open status" })
vim.keymap.set("n", "<leader>gs", ":Git switch ", { desc = "Git: Switch branch" })
vim.keymap.set("n", "<leader>gc", "<CMD>Git commit<CR>", { silent = true, desc = "Git: Create commit" })
vim.keymap.set("n", "<leader>go", ":Git push -u origin ", { desc = "Git: Push with upstream" })
vim.keymap.set("n", "<leader>gd", function()
	require("mini.diff").toggle_overlay()
end, { silent = true, desc = "Git: Toggle hunk overlay" })
vim.keymap.set("n", "<leader>gl", "<cmd>Git log --oneline --graph --decorate --all<CR>", { desc = "Git: Show log graph" })
vim.keymap.set("n", "]g", function()
	require("mini.diff").goto_hunk("next", { wrap = false })
end, { desc = "Git: Go to next hunk" })
vim.keymap.set("n", "[g", function()
	require("mini.diff").goto_hunk("prev", { wrap = false })
end, { desc = "Git: Go to previous hunk" })

vim.keymap.set("n", "<leader>ghi", "<CMD>Octo issue list<CR>", { desc = "GitHub: List issues" })
vim.keymap.set("n", "<leader>ghI", "<CMD>Octo issue create<CR>", { desc = "GitHub: Create issue" })
vim.keymap.set("n", "<leader>ghp", "<CMD>Octo pr list<CR>", { desc = "GitHub: List pull requests" })
vim.keymap.set("n", "<leader>ghP", "<CMD>Octo pr create<CR>", { desc = "GitHub: Create pull request" })
