return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
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
				{ name = "nvim_lsp", max_item_count = 10, group_index = 1, keyword_length = 3 },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "buffer", max_item_count = 1, keyword_length = 3 },
				{ name = "path", max_item_count = 1 },
				{ name = "nvim_lua" },
			}),

			performance = {
				trigger_debounce_time = 500,
				throttle = 550,
				fetching_timeout = 80,
			},
		})
	end,
}
