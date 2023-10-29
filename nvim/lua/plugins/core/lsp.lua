return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
	},

	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
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
			-- { "simrat39/rust-tools.nvim", lazy = true },
			{ "mrcjkb/rustaceanvim" },
			{ "pmizio/typescript-tools.nvim", lazy = true },
		},
		config = function()
			local lsp = require("lsp-zero")
			require("mason").setup({})
			require("mason-lspconfig").setup({})

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
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

			lspconfig.taplo.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.bashls.setup({})
			lspconfig.pyright.setup({})

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

			lspconfig.gdscript.setup({
				cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
			})

			local lldb_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/"
			local codelldb = lldb_path .. "adapter/codelldb"
			local lidlldb = lldb_path
				.. "lldb/lib/liblldb"
				.. (vim.loop.os_uname().sysname == "Linux" and ".so" or ".dylib")

			-- require("rust-tools").setup({
			-- 	dap = {
			-- 		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb, lidlldb),
			-- 	},
			-- 	server = {
			-- 		on_attach = function(_, bufnr)
			-- 			vim.keymap.set(
			-- 				"n",
			-- 				"<leader>lha",
			-- 				require("rust-tools").hover_actions.hover_actions,
			-- 				{ buffer = bufnr, desc = "[H]over [A]ction" }
			-- 			)
			-- 			vim.keymap.set(
			-- 				"n",
			-- 				"<leader>lca",
			-- 				require("rust-tools").code_action_group.code_action_group,
			-- 				{ buffer = bufnr, desc = "[C]ode [A]ction" }
			-- 			)
			-- 		end,
			-- 	},
			-- })

			require("typescript-tools").setup({
				tsserver_file_preferences = {
					-- Inlay Hints
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
				settings = {
					expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
				},
				tsserver_path = "typescript-language-server",
			})
			-- lspconfig.tsserver.setup({})
			lspconfig.astro.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.angularls.setup({})
			lspconfig.svelte.setup({})
			lspconfig.zls.setup({})
			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
			lspconfig.ols.setup({})

			lsp.setup()
		end,
	},
}
