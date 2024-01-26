return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
	},

	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp", lazy = true },
			{ "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },
			{
				"williamboman/mason.nvim",
				lazy = true,
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim", lazy = true },
			{ "pmizio/typescript-tools.nvim", lazy = true },
			{ "mrcjkb/rustaceanvim", version = "^3", ft = { "rust" } },
		},
		config = function()
			local lsp = require("lsp-zero")

			lsp.on_attach(function(client, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, function()
						func()
					end, { buffer = bufnr, desc = desc })
				end
				nmap("<leader>lrn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>lca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				nmap("<leader>lgd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("<leader>lgr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("<leader>lgI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				nmap("<leader>lD", vim.lsp.buf.type_definition, "Type [D]efinition")
				nmap("<leader>lds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- See `:help K` for why this keymap
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

				nmap("]d", vim.diagnostic.goto_next, "Next Diagnostic")
				nmap("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
			end)

			--Manual Servers
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"angularls",
					"html",
					"cssls",
					"emmet_ls",
					"tailwindcss",
					"dockerls",
					"taplo",
					"yamlls",
					"jsonls",
					"bashls",
					"pyright",
					"clangd",
					"rust_analyzer@nightly",
				},
				handlers = {
					lsp.default_setup,
					lua_ls = function()
						require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
					end,
					emmet_ls = function()
						require("lspconfig").emmet_ls.setup({
							filetypes = {
								"astro",
								"css",
								"html",
								"javascriptreact",
								"less",
								"sass",
								"scss",
								"svelte",
								"typescriptreact",
							},
						})
					end,
					tsserver = function() end,
					rust_analyzer = function() end,
				},
			})

			require("typescript-tools").setup({
				settings = {
					expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
				},
				tsserver_path = "typescript-language-server",
			})

			lsp.setup()
		end,
	},
}
