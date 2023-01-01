-- Only required if you have packer configured as `opt`
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	use("nvim-lualine/lualine.nvim")
	use("luisiacc/gruvbox-baby")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use({ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" })

	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("lukas-reineke/indent-blankline.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")

	use("kdheepak/lazygit.nvim")
	use("lewis6991/gitsigns.nvim")
	use("numToStr/Comment.nvim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
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
	})

	use("simrat39/rust-tools.nvim")

	use("jose-elias-alvarez/null-ls.nvim")

	if is_bootstrap then
		require("packer").sync()
	end
end)

if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end
