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
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, function()
						func()
					end, { buffer = bufnr, desc = desc })
				end
				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
				nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- See `:help K` for why this keymap
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

				-- Lesser used LSP functionality
				nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
				nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")

				nmap("]d", vim.diagnostic.goto_next, "Next Diagnostic")
				nmap("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
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
					["gopls"] = { "go" },
				},
			})

			lsp.ensure_installed({
				"rust_analyzer",
				"tsserver",
				"angularls",
			})
			lsp.skip_server_setup({ "tsserver" })

			--Manual Servers
			local lspconfig = require("lspconfig")
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
