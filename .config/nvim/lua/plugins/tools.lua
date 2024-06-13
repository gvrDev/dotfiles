return {
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			columns = { "icon" },
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
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
}
