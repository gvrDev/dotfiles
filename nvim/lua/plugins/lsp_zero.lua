return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.preset({
			name = "recommended",
			set_lsp_keymaps = false,
			suggest_lsp_servers = false,
			sign_icons = false,
			manage_nvim_cmp = false,
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
					"lua",
				},
				["rust_analyzer"] = { "rust" },
				["clangd"] = { "c", "cpp" },
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

		lspconfig.clangd.setup({
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
			},
		})

		lsp.setup()
	end,
}
