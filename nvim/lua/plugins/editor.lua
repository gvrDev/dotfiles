return {
	{ "tpope/vim-sleuth" },

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

				nmap("<leader>gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("<leader>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("<leader>gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
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
			end)

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

	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
				sync_install = false,
				auto_install = true,
				ensure_installed = {
					"typescript",
					"toml",
					"json",
					"yaml",
					"css",
					"html",
					"lua",
					"rust",
					"bash",
					"svelte",
					"tsx",
					"jsdoc",
					"markdown",
				},
				ignore_install = { "javascript" },
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		version = false,
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-cmdline" },

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
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
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
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "nvim_lua" },
					{ name = "nvim_lsp_signature_help" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{ "mfussenegger/nvim-dap", lazy = true },
			{ "theHamsta/nvim-dap-virtual-text", lazy = true },
			{
				"jay-babu/mason-nvim-dap.nvim",
				opts = {
					automatic_setup = true,
					handlers = {},
				},
			},

			"mxsdev/nvim-dap-vscode-js",
		},
		config = function()
			require("dapui").setup({})
		end,
		keys = {
			{
				"<leader>td",
				"<cmd>lua require('dapui').toggle('sidebar')<cr>",
				desc = "Toggle Dap ui",
				mode = "n",
			},
			{
				"<leader>dc",
				"<cmd>DapContinue<cr>",
				desc = "Dap Continue",
				mode = "n",
			},
			{
				"<leader>db",
				"<cmd>DapToggleBreakpoint<cr>",
				desc = "Dap Toggle Breakpoint",
				mode = "n",
			},
		},
	},
}
