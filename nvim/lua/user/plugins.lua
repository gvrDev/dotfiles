vim.opt.guicursor = ""
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local function setup_plugin(file_name)
	local plugin = require(string.format("user.plugins.%s", file_name))

	if plugin.setup == nil then
		if plugin.name == nil then
			print("Please provide a name for the plugin on the file: " .. file_name)
			return
		end

		require(plugin.name).setup(plugin.opts)

		if plugin.keymaps ~= nil then
			plugin.keymaps()
		end

		if plugin.aucmds ~= nil then
			plugin.aucmds()
		end
	else
		plugin.setup()
	end
end

require("lazy").setup({
	"nvim-lua/plenary.nvim",

	{
		"nvim-lualine/lualine.nvim",
		config = function()
			setup_plugin("lualine")
		end,
	},

	"luisiacc/gruvbox-baby",
	-- "sainnhe/gruvbox-material",
	-- "sainnhe/everforest",
	-- { "catppuccin/nvim", as = "catppuccin" },

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			setup_plugin("treesitter")
		end,
	},
	{ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },

	{
		"windwp/nvim-autopairs",
		config = function()
			setup_plugin("autopairs")
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		config = function()
			setup_plugin("autotag")
		end,
	},

	"tpope/vim-surround",
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			setup_plugin("indent-blankline")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		config = function()
			setup_plugin("telescope")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			setup_plugin("nvim-tree")
		end,
	},

	{
		"ThePrimeagen/harpoon",
		config = function()
			setup_plugin("harpoon")
		end,
	},

	{
		"mbbill/undotree",
		config = function()
			setup_plugin("undotree")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			setup_plugin("gitsigns")
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			setup_plugin("comment")
		end,
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			setup_plugin("lsp-zero")
		end,
	},

	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			setup_plugin("lspsaga")
		end,
	},

	-- {
	-- 	"simrat39/rust-tools.nvim",
	-- 	config = function()
	-- 		setup_plugin("rust-tools")
	-- 	end,
	-- },

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			setup_plugin("null-ls")
		end,
	},

	{
		"jose-elias-alvarez/typescript.nvim",
		config = function()
			setup_plugin("typescript")
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			setup_plugin("colorizer")
		end,
	},
})
