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

	"sainnhe/everforest",
	{ "catppuccin/nvim", name = "catppuccin" },
	"ellisonleao/gruvbox.nvim",

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			setup_plugin("treesitter")
		end,
	},
	{ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },

	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	config = function()
	-- 		setup_plugin("autopairs")
	-- 	end,
	-- },

	{
		"altermo/ultimate-autopair.nvim",
		config = function()
			require("ultimate-autopair").setup({})
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
		tag = "0.1.1",
		config = function()
			setup_plugin("telescope")
		end,
		dependencies = { { "nvim-telescope/telescope-file-browser.nvim" } },
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
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			{ "L3MON4D3/LuaSnip" },
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
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

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
