return {
	"folke/noice.nvim",
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
	},
	opts = {
		cmdline = {
			enabled = true,
		},
		messages = {
			enabled = false,
		},
		popupmenu = {
			enabled = true,
		},
		lsp = {
			signature = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},
		},
	},
}
