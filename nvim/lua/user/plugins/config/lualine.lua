require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "everforest",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "filetype", "branch" },
		lualine_b = { "diagnostics" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "filename", "fileformat" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
