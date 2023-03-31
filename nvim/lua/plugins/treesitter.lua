return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPre",
	dependencies = {
		{ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },
		{
			"windwp/nvim-ts-autotag",
			config = function()
				require("nvim-treesitter.configs").setup({
					autotag = {
						enable = true,
					},
				})
			end,
		},
	},
	opts = {
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		sync_install = false,
		auto_install = true,
		ensure_installed = {
			"help",
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
	},
}
