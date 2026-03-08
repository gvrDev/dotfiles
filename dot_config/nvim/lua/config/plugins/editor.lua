-- SETUP --
require("nvim-treesitter.config").setup({
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
require("mini.hipatterns").setup()
require("mini.indentscope").setup()
require("mini.bufremove").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.notify").setup()
require("mini.statusline").setup({
	content = {
		active = function()
			local ms = require("mini.statusline")
			local git = ms.section_git({ trunc_width = 40 })
			local diagnostics = ms.section_diagnostics({ trunc_width = 75 })
			local filename = ms.section_filename({ trunc_width = 140 })
			local fileinfo = ms.section_fileinfo({ trunc_width = 120 })

			return ms.combine_groups({
				{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
				"%<", -- Mark general truncate point
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
			})
		end,
	},
})
require("solarized").setup({ transparent = { enabled = true } })
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
end, { silent = true, desc = "Search Files" })
vim.keymap.set("n", "<leader>sg", function()
	require("fzf-lua").live_grep()
end, { silent = true, desc = "Search Grep" })
vim.keymap.set("n", "<leader><leader>", function()
	require("fzf-lua").buffers()
end, { silent = true, desc = "Pick Open Buffers" })

vim.keymap.set("n", "<leader>.", "<CMD>Oil<CR>", { silent = true })
vim.keymap.set("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { silent = true })

vim.keymap.set("n", "<leader>bd", require("mini.bufremove").delete, { silent = true })

local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end)

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
