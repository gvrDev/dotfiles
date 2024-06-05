return {
	{
		"stevearc/oil.nvim",
		opts = {
			columns = { "icon" },
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>.",
				vim.cmd.Oil,
				mode = "n",
				desc = "Open Oil file manager",
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
	{
		"mbbill/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
		keys = {
			{
				"<leader>tu",
				vim.cmd.UndotreeToggle,
				desc = "Open undo tree",
				mode = "n",
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
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon"):setup({})
		end,
		keys = {
			{
				"<leader>ha",
				function()
					require("harpoon"):list():append()
				end,
				desc = "Add buffer to harpoon",
				mode = "n",
			},
			{
				"<leader>th",
				function()
					require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
				end,
				desc = "Harpoon buffer list",
				mode = "n",
			},
			{
				"<leader>1",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Go to first buffer in harpoon",
				mode = "n",
			},
			{
				"<leader>2",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Go to second buffer in harpoon",
				mode = "n",
			},
			{
				"<leader>3",
				function()
					require("harpoon"):list():select(3)
				end,
				mode = "n",
				desc = "Go to third buffer in harpoon",
			},
			{
				"<leader>4",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Go to fourth buffer in harpoon",
				mode = "n",
			},
		},
	},

	{
		"tpope/vim-dadbod",
		"kristijanhusak/vim-dadbod-completion",
		"kristijanhusak/vim-dadbod-ui",
	},
}
