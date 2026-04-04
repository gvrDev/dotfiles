-- SETUP --
require("nvim-treesitter").setup({
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },

		javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
		typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },

		html = { "prettierd", "prettier", stop_after_first = true },
		htmlangular = { "prettierd", "prettier", stop_after_first = true },
		css = { "biome", "prettierd", "prettier", stop_after_first = true },
		less = { "prettierd", "prettier", stop_after_first = true },
		scss = { "prettierd", "prettier", stop_after_first = true },

		json = { "biome", "prettierd", "prettier", stop_after_first = true },
		jsonc = { "biome", "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
	},
})
require("mini.icons").setup()
require("mini.ai").setup()
require("mini.indentscope").setup()
require("mini.bufremove").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("harpoon"):setup()
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	watch_for_changes = true,
	keymaps = {
		["q"] = { "actions.close", mode = "n" },
		["h"] = { "actions.parent", mode = "n" },
		["l"] = { "actions.select", mode = "n" },
	},
})
require("fzf-lua").setup()
----

-- Keymaps --
vim.keymap.set("n", "<leader>sf", function()
	require("fzf-lua").files()
end, { silent = true, desc = "Search: Find files" })
vim.keymap.set("n", "<leader>sg", function()
	require("fzf-lua").live_grep()
end, { silent = true, desc = "Search: Live grep" })
vim.keymap.set("n", "<leader><leader>", function()
	require("fzf-lua").buffers()
end, { silent = true, desc = "Buffer: Pick open buffer" })

vim.keymap.set("n", "<leader>.", "<CMD>Oil<CR>", { silent = true, desc = "Files: Open explorer" })
vim.keymap.set("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { silent = true, desc = "Undo: Toggle tree" })

vim.keymap.set(
	"n",
	"<leader>bd",
	require("mini.bufremove").delete,
	{ silent = true, desc = "Buffer: Delete current buffer" }
)

local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: Toggle quick menu" })
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Harpoon: Add current file" })
vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end, { desc = "Harpoon: Go to file 1" })
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end, { desc = "Harpoon: Go to file 2" })
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end, { desc = "Harpoon: Go to file 3" })
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end, { desc = "Harpoon: Go to file 4" })

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},
})
