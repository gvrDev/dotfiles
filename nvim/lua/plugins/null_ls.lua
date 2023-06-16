return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufReadPre",
	config = function()
		local null_ls = require("null-ls")
		local b = null_ls.builtins

		local sources = {

			b.formatting.prettierd.with({
				filetypes = {
					"html",
					"yaml",
					"markdown",
					"typescript",
					"javascript",
					"svelte",
					"tsx",
					"typescriptreact",
					"javascriptreact",
					"jsx",
					"css",
					"scss",
					"sass",
					"json",
					"vue",
				},
			}),
			require("typescript.extensions.null-ls.code-actions"),

			b.formatting.stylua,

			b.formatting.rustfmt,

			b.formatting.shfmt,
		}

		null_ls.setup({
			debug = true,
			sources = sources,
		})
	end,
}
