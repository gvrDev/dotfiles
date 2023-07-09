return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			config = function() end,
		},
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			sync_install = false,
			auto_install = true,
			ensure_installed = {
				"typescript",
				"toml",
				"json",
				"yaml",
				"css",
				"html",
				"lua",
				"rust",
				"bash",
				"svelte",
				"markdown",
			},
			ignore_install = { "javascript" },
			autotag = {
				enable = true,
			},
		})
	end,
}
