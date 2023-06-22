return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
		config = function()
			require("lsp-zero.settings").preset({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		},
		config = function()
			local lsp = require("lsp-zero")

			lsp.preset({
				name = "recommended",
				set_lsp_keymaps = false,
				manage_nvim_cmp = false,
			})

			lsp.set_server_config({
				on_init = function(client)
					client.server_capabilities.textDocument.foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					}
				end,
			})

			lsp.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts)
				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol()
				end, opts)
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, opts)
				vim.keymap.set("n", "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, opts)
				vim.keymap.set("n", "<leader>vrr", function()
					vim.lsp.buf.references()
				end, opts)
				vim.keymap.set("n", "<leader>vrn", function()
					vim.lsp.buf.rename()
				end, opts)
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
				ClearFoldHighlightColors()
			end)

			lsp.format_on_save({
				servers = {
					["null-ls"] = {
						"javascript",
						"typescript",
						"jsx",
						"tsx",
						"javascriptreact",
						"typescriptreact",
						"html",
						"css",
						"scss",
						"sass",
						"lua",
						"sh",
						"json",
						"svelte",
						"vue",
					},
					["rust_analyzer"] = { "rust" },
					["clangd"] = { "c", "cpp" },
					["omnisharp"] = { "cs" },
				},
			})

			lsp.ensure_installed({
				"rust_analyzer",
				"tsserver",
				"angularls",
			})

			--Manual Servers
			lsp.skip_server_setup({ "tsserver" })

			local lspconfig = require("lspconfig")
			lspconfig.gdscript.setup({})
			lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

			lspconfig.emmet_ls.setup({
				filetypes = {
					"astro",
					"css",
					"eruby",
					"html",
					"htmldjango",
					"javascriptreact",
					"less",
					"pug",
					"sass",
					"scss",
					"svelte",
					"typescriptreact",
				},
			})
			lspconfig.eslint.setup({
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"svelte",
					"astro",
				},
			})

			lspconfig.clangd.setup({
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
				},
			})

			lspconfig.omnisharp.setup({
				on_init = function(client)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
			lsp.setup()
		end,
	},
}
