return {
	-- catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
			integrations = {
				cmp = true,
				telescope = true,
				treesitter = true,
				dashboard = true,
				harpoon = true,
				mason = true,
				noice = true,
				which_key = true,
				dap = {
					enabled = true,
					enable_ui = true,
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		},
	},

	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			transparent_mode = true,
		},
	},
	{ "nyoom-engineering/oxocarbon.nvim" },
}
