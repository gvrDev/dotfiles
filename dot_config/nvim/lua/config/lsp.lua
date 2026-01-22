vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { silent = true })
vim.keymap.set("n", "<leader>lgd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, { silent = true })

local angularls_config = {
	on_attach = function(client)
		client.server_capabilities.renameProvider = false
	end,
}

local angular_plugin = {
	name = "@angular/language-server",
	location = vim.fs.joinpath(
		vim.fn.stdpath("data"),
		"mason",
		"packages",
		"angular-language-server",
		"node_modules",
		"@angular",
		"language-server"
	),
	enableForWorkspaceTypeScriptVersions = false,
}
local vtsls_config = {
	settings = {
		vtsls = {
			enableMoveToFileCodeAction = true,
			autoUseWorkspaceTsdk = true,
			experimental = {
				maxInlayHintLength = 30,
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
			tsserver = {
				globalPlugins = {
					angular_plugin,
				},
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
}

local lua_ls_config = {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
}
vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("angularls", angularls_config)
vim.lsp.config("lua_ls", lua_ls_config)

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"vtsls",
		"angularls",
		"biome",
		"tailwindcss",
		"lua_ls",
		"clangd",
		"cssls",
		"html",
		"jsonls",
		"taplo",
		"zls",
		"stylua",
	},
	automatic_enable = true,
})

vim.diagnostic.config({
	severity_sort = true,
	float = { "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})
