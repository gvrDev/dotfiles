vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	{ src = "https://github.com/saghen/blink.cmp", version = "v1.8.0" },

	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/stevearc/conform.nvim",

	"https://github.com/echasnovski/mini.nvim",
	"https://github.com/tpope/vim-fugitive",

	"https://github.com/tpope/vim-sleuth",

	"https://github.com/mbbill/undotree",
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	"https://github.com/folke/snacks.nvim",
	"https://github.com/sphamba/smear-cursor.nvim",
	"https://github.com/stevearc/oil.nvim",
})

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
require("blink.cmp").setup({
	cmdline = { enabled = false },
	completion = {
		menu = {
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind_icon", "kind" },
				},
			},
		},
	},
	signature = {
		enabled = true,
		window = {
			show_documentation = false,
		},
	},
	keymap = {
		preset = "default",
		["<C-h>"] = { "show_signature", "hide_signature" },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
require("mini.icons").setup()
require("mini.ai").setup()
require("mini.diff").setup()
require("mini.hipatterns").setup()
require("mini.indentscope").setup()
require("kanagawa").setup({
	compile = true,
	transparent = true,
	colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
	overrides = function(colors)
		local theme = colors.theme
		local accent = "#FFA066" -- Your Surimi Orange accent
		local makeDiagnosticColor = function(color)
			local c = require("kanagawa.lib.color")
			return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
		end
		return {
			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none" },
			FloatTitle = { bg = "none" },
			NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
			LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
			DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
			DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
			DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
			CursorLineNr = { fg = accent, bold = true },
			PmenuSel = { bg = accent, fg = theme.ui.bg_m3 },
			LineNr = { fg = theme.ui.fg_dim },
			TelescopeBorder = { fg = accent, bg = "none" },
			TelescopeTitle = { fg = accent, bold = true },
		}
	end,
})
require("snacks").setup({
	input = { enabled = true },
	statuscolumn = { enabled = true },
	picker = { enabled = true },
	gh = { enabled = true },
})
local harpoon = require("harpoon")
harpoon:setup()
require("smear_cursor").setup({
	cursor_color = "#FFA066",

	stiffness = 0.8, -- 0.6      [0, 1]
	trailing_stiffness = 0.6, -- 0.45     [0, 1]
	stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
	trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
	damping = 0.95, -- 0.85     [0, 1]
	damping_insert_mode = 0.95, -- 0.9      [0, 1]
	distance_stop_animating = 0.5, -- 0.1      > 0

	gamma = 1.0,
})
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

vim.keymap.set("n", "<leader>.", "<CMD>Oil<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>", function()
	Snacks.picker.buffers()
end, { silent = true })
vim.keymap.set("n", "<leader>sf", function()
	Snacks.picker.files({ hidden = true })
end, { silent = true, desc = "Search Files" })
vim.keymap.set("n", "<leader>sg", function()
	Snacks.picker.grep({ hidden = true })
end, { silent = true, desc = "Search Grep" })
vim.keymap.set("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { silent = true })

vim.keymap.set("n", "<leader>gg", "<CMD>Git<CR>", { silent = true })
vim.keymap.set("n", "<leader>gs", ":Git switch ")
vim.keymap.set("n", "<leader>gc", "<CMD>Git commit<CR>", { silent = true })
vim.keymap.set("n", "<leader>go", ":Git push -u origin ")
vim.keymap.set("n", "<leader>gd", function()
	if vim.wo.diff then
		vim.cmd("diffoff!")
		vim.cmd("only")
	else
		vim.cmd("Gdiffsplit")
	end
end, { silent = true })
vim.keymap.set("n", "<leader>gl", "<CMD>Git log<CR>", { silent = true })
vim.keymap.set("n", "<leader>gi", "<CMD>lua Snacks.picker.gh_issue()<CR>", { silent = true })
vim.keymap.set("n", "<leader>gI", "<CMD>lua Snacks.picker.gh_issue({ state = 'all' })<CR>", { silent = true })
vim.keymap.set("n", "<leader>gp", "<CMD>lua Snacks.picker.gh_pr()<CR>", { silent = true })
vim.keymap.set("n", "<leader>gP", "<CMD>lua Snacks.picker.gh_pr({ state = 'all' })<CR>", { silent = true })

vim.keymap.set("n", "<leader>bd", require("mini.bufremove").delete, { silent = true })

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

vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
