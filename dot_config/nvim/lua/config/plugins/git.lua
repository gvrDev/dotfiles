-- SETUP --
require("gitsigns").setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "▎" },
		untracked = { text = "▎" },
	},

	signs_staged = {
		add = { text = "▏" },
		change = { text = "▏" },
		delete = { text = "▏" },
		topdelete = { text = "▏" },
		changedelete = { text = "▏" },
		untracked = { text = "▏" },
	},

	numhl = true,
})

local close = function()
	vim.cmd("DiffviewClose")
end
require("diffview").setup({
	keymaps = {
		view = {
			["q"] = close,
		},
		file_panel = {
			["q"] = close,
		},
		file_history_panel = {
			["q"] = close,
		},
		option_panel = {
			["q"] = close,
		},
	},
})
require("octo").setup({
	picker = "fzf-lua",
})
----

-- Keymaps --
vim.keymap.set("n", "<leader>gg", "<CMD>Git<CR>", { silent = true })
vim.keymap.set("n", "<leader>gs", ":Git switch ")
vim.keymap.set("n", "<leader>gc", "<CMD>Git commit<CR>", { silent = true })
vim.keymap.set("n", "<leader>go", ":Git push -u origin ")
vim.keymap.set("n", "<leader>gd", function()
	if next(require("diffview.lib").views) == nil then
		vim.cmd("DiffviewOpen")
	else
		vim.cmd("DiffviewClose")
	end
end, { silent = true, desc = "Git diff (Diffview toggle)" })
vim.keymap.set("n", "<leader>gl", "<cmd>Git log --oneline --graph --decorate --all<CR>", { desc = "Git log graph" })
vim.keymap.set("n", "]g", function()
	require("gitsigns").nav_hunk("next", { wrap = true })
end)
vim.keymap.set("n", "[g", function()
	require("gitsigns").nav_hunk("prev", { wrap = true })
end)

vim.keymap.set("n", "<leader>ghi", "<CMD>Octo issue list<CR>")
vim.keymap.set("n", "<leader>ghI", "<CMD>Octo issue create<CR>")
vim.keymap.set("n", "<leader>ghp", "<CMD>Octo pr list<CR>")
vim.keymap.set("n", "<leader>ghP", "<CMD>Octo pr create<CR>")

vim.keymap.set("n", "<leader>hs", require("gitsigns").stage_hunk)
vim.keymap.set("n", "<leader>hS", require("gitsigns").stage_buffer)
