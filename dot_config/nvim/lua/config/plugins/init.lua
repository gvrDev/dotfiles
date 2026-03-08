vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate" },
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	"https://github.com/ibhagwan/fzf-lua",

	"https://github.com/maxmx03/solarized.nvim",
	"https://github.com/stevearc/conform.nvim",

	"https://github.com/echasnovski/mini.nvim",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/sindrets/diffview.nvim",
	"https://github.com/pwntester/octo.nvim",

	"https://github.com/tpope/vim-sleuth",

	"https://github.com/mbbill/undotree",
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	"https://github.com/stevearc/oil.nvim",
})

require("config.plugins.editor")
require("config.plugins.git")
require("config.plugins.lsp")
