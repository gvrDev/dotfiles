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

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
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
