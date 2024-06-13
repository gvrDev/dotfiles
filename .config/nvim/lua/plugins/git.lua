return {
	{
		"ThePrimeagen/git-worktree.nvim",
		opts = {},
		keys = {
			{
				"<leader>st",
				"<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
				mode = "n",
				desc = "[N]ew work[T]ree",
			},
			{
				"<leader>nt",
				"<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
				mode = "n",
				desc = "[S]earch work[T]ree",
			},
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
		},
		config = true,
		keys = {
			{
				"<leader>tg",
				vim.cmd.Neogit,
				mode = "n",
				desc = "Neogit",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}
