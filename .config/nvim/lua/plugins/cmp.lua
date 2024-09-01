return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
		},
		config = function()
			local cmp = require("cmp")

			require("snippets").register_cmp_source()
			cmp.setup({
				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{ name = "snp" },
					{ name = "buffer" },
				},
			})
		end,
	},
}
