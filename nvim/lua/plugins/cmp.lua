return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lua" },

		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
		{ "saadparwaiz1/cmp_luasnip" },
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 6 },
				{ name = "luasnip", priority = 5 },
				{ name = "buffer", priority = 4 },
				{ name = "path", priority = 3 },
				{ name = "nvim_lua", priority = 2 },
				{ name = "nvim_lsp_signature_help", priority = 1 },
				{ name = "orgmode", keyword_length = 1 },
			}),
		})
	end,
}
