return {
	{ "catppuccin/nvim", name = "catppuccin", config = true },
	{ "scottmckendry/cyberdream.nvim", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		opts = {
			highlight_groups = {
				TelescopeBorder = { fg = "highlight_high", bg = "none" },
				TelescopeNormal = { bg = "none" },
				TelescopePromptNormal = { bg = "base" },
				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "base" },
				TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {},
	},
}
