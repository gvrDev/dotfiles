return {
	{
		"stevearc/oil.nvim",
		opts = {
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
		"desdic/greyjoy.nvim",
		keys = {
			{
				"<leader>ot",
				vim.cmd.Greyjoy,
				desc = "Open greyjoy",
				mode = "n",
			},
		},
		config = function()
			local greyjoy = require("greyjoy")
			greyjoy.setup({
				output_results = "toggleterm",
				last_first = true,
			})
			greyjoy.load_extension("generic")
			greyjoy.load_extension("vscode_tasks")
			greyjoy.load_extension("makefile")
			greyjoy.load_extension("kitchen")
			greyjoy.load_extension("cargo")
			greyjoy.load_extension("docker_compose")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		version = "*",
		opts = { direction = "float", start_in_insert = false, close_on_exit = true, persist_mode = false },
	},
}
