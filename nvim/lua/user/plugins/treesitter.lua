local plugin = {
	name = "nvim-treesitter.configs",
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
return plugin
