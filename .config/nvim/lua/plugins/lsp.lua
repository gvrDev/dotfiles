return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("<leader>lgd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("<leader>lrn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>lca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
				end,
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			local servers = {
				angularls = {
					server_capabilities = {
						renameProvider = false,
					},
				},
				clangd = {
					cmd = { "/usr/bin/clangd" },
				},
				biome = {},
				lua_ls = {
					server_capabilities = {
						semanticTokensProvider = nil,
					},
				},
				tsserver = {},
				vtsls = {
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
					settings = {
						complete_function_calls = true,
						vtsls = {
							enableMoveToFileCodeAction = true,
							autoUseWorkspaceTsdk = true,
							experimental = {
								completion = {
									enableServerSideFuzzyMatch = true,
								},
							},
						},
						typescript = {
							updateImportsOnFileMove = { enabled = "always" },
							suggest = {
								completeFunctionCalls = true,
							},
							inlayHints = {
								enumMemberValues = { enabled = true },
								functionLikeReturnTypes = { enabled = true },
								parameterNames = { enabled = "literals" },
								parameterTypes = { enabled = true },
								propertyDeclarationTypes = { enabled = true },
								variableTypes = { enabled = false },
							},
						},
					},
				},
			}

			require("mason").setup()
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						if server_name == "tsserver" then
							return
						end
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome" },
				typescript = { "biome" },
				jsx = { "biome" },
				tsx = { "biome" },
				json = { "biome" },
				jsonc = { "biome" },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				less = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},
}
