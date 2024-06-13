return {
	"epwalsh/obsidian.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "main",
				path = "~/obsidian-vault/main",
			},
		},
		completion = {
			nvim_cmp = true,
		},
		daily_notes = {
			folder = "notes/daily",
		},
	},
}
