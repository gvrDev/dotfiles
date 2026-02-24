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

	"https://github.com/tpope/vim-sleuth",

	"https://github.com/mbbill/undotree",
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	"https://github.com/stevearc/oil.nvim",
})

require("nvim-treesitter.config").setup({
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },

		javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
		typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },

		html = { "prettierd", "prettier", stop_after_first = true },
		htmlangular = { "prettierd", "prettier", stop_after_first = true },
		css = { "biome", "prettierd", "prettier", stop_after_first = true },
		less = { "prettierd", "prettier", stop_after_first = true },
		scss = { "prettierd", "prettier", stop_after_first = true },

		json = { "biome", "prettierd", "prettier", stop_after_first = true },
		jsonc = { "biome", "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
	},
})
require("blink.cmp").setup({
	cmdline = { enabled = false },
	completion = {
		menu = {
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind_icon", "kind" },
				},
			},
		},
	},
	signature = {
		enabled = true,
		window = {
			show_documentation = false,
		},
	},
	keymap = {
		preset = "default",
		["<C-h>"] = { "show_signature", "hide_signature" },
	},
	fuzzy = { implementation = "prefer_rust", prebuilt_binaries = { download = true } },
})
require("mini.icons").setup()
require("mini.ai").setup()
require("mini.hipatterns").setup()
require("mini.indentscope").setup()
require("mini.bufremove").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.notify").setup()
require("solarized").setup({ transparent = { enabled = true } })
require("harpoon"):setup()
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	watch_for_changes = true,
	keymaps = {
		["q"] = { "actions.close", mode = "n" },
		["h"] = { "actions.parent", mode = "n" },
		["l"] = { "actions.select", mode = "n" },
	},
})
require("fzf-lua").setup()
