local plugin = {
	name = "lspsaga",
	opts = {
		lightbulb = {
			enable = false,
		},
		server_filetype_map = {
			typescript = "typescript",
		},
		rename_action_quit = "<C-c>",
	},
	keymaps = function()
		local keymap = vim.keymap.set
		local options = { silent = true, noremap = true }
		keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", options)
		keymap({ "n", "v" }, "<leader>vca", "<cmd>Lspsaga code_action<CR>", options)
		keymap("n", "vrn", "<cmd>Lspsaga rename<CR>", options)
		keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", options)
		keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", options)
		keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", options)
		keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", options)
		keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", options)
		keymap("n", "[D", function()
			require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, options)
		keymap("n", "]D", function()
			require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
		end, options)
		keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", options)
		keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", options)
	end,
}

return plugin
