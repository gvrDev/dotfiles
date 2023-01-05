-- Only required if you have packer configured as `opt`
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

local config_path = "user.plugins.config"
function give_path(file_name)
	return string.format("require('%s.%s')", config_path, file_name)
end

require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	use({ "nvim-lualine/lualine.nvim", config = give_path("lualine") })
	use("luisiacc/gruvbox-baby")
	use("sainnhe/gruvbox-material")
	use({ "catppuccin/nvim", as = "catppuccin" })

	use({ "nvim-treesitter/nvim-treesitter", config = give_path("treesitter") })
	use({ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" })

	use({ "windwp/nvim-autopairs", config = give_path("autopairs") })
	use({ "windwp/nvim-ts-autotag", config = give_path("autotag") })
	use("tpope/vim-surround")
	use({ "lukas-reineke/indent-blankline.nvim", config = give_path("indent-blankline") })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		config = give_path("telescope"),
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = give_path("nvim-tree"),
	})
	use({ "ThePrimeagen/harpoon", config = give_path("harpoon") })
	use({ "mbbill/undotree", config = give_path("undotree") })

	use({ "lewis6991/gitsigns.nvim", config = give_path("gitsigns") })
	use({ "numToStr/Comment.nvim", config = give_path("comment") })

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
		config = give_path("lsp"),
	})

	use({ "simrat39/rust-tools.nvim", config = give_path("rust-tools") })
	use({ "jose-elias-alvarez/null-ls.nvim", config = give_path("null-ls") })

	use({ "NvChad/nvim-colorizer.lua", config = give_path("colorizer") })

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
