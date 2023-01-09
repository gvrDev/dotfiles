vim.opt.background = "dark"
-- vim.g.gruvbox_baby_background_color = "medium"
-- vim.g.gruvbox_baby_transparent_mode = "true"
-- vim.g.gruvbox_baby_telescope_theme = 0
-- --
-- vim.g.gruvbox_material_background = "soft"
-- vim.g.gruvbox_material_foreground = "original"
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_transparent_background = 0
-- vim.g.gruvbox_material_diagnostic_text_highlight = 0
-- vim.g.gruvbox_material_diagnostic_line_highlight = 0
-- vim.g.gruvbox_material_diagnostic_virtual_text = 0
--

vim.g.everforest_better_performance = 1
vim.g.everforest_transparent_background = true
vim.g.everforest_background = "hard"

function ColorizeNVIM(color)
	color = color or "everforest"
	vim.cmd.colorscheme(color)
end

ColorizeNVIM()
