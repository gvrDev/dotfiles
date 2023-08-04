return {

	{ "folke/which-key.nvim", opts = {} },

	{
		"folke/noice.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim", lazy = true },
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				signature = {
					enabled = false,
				},
				hover = {
					enabled = false,
				},
			},
		},
	},

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
