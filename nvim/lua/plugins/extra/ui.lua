return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			wk.setup({})

			wk.register({
				b = { name = "buffer" },
				d = { name = "dap" },
				r = { name = "refactor" },
				l = { name = "lsp" },
				g = { name = "git" },
				t = { name = "toggle" },
			}, { prefix = "<leader>" })
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		keys = {
			{
				"<leader>tt",
				"<cmd>TroubleToggle<cr>",
				desc = "Toggle Trouble ui",
				mode = "n",
			},
		},
	},

	{ "j-hui/fidget.nvim", opts = {} },

	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				tailwind = true,
				names = false,
			},
		},
	},
}
