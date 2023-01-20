vim.opt.background = "dark"
vim.g.gruvbox_baby_background_color = "medium"
vim.g.gruvbox_baby_transparent_mode = "true"
vim.g.gruvbox_baby_telescope_theme = 0

-- vim.g.gruvbox_material_background = "hard"
-- vim.g.gruvbox_material_foreground = "material"
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_transparent_background = 1
-- vim.g.gruvbox_material_diagnostic_text_highlight = 1
-- vim.g.gruvbox_material_diagnostic_line_highlight = 1
-- vim.g.gruvbox_material_diagnostic_virtual_text = 1

-- vim.g.everforest_better_performance = 1
-- vim.g.everforest_transparent_background = true
-- vim.g.everforest_background = "soft"

function ColorizeNVIM(color)
	color = color
	vim.cmd.colorscheme(color)
	vim.cmd([[hi LineNr guibg=none guifg=#bdae93]])
	vim.cmd([[hi EndOfBuffer guibg=none guifg=#bdae93]])
end

ColorizeNVIM("gruvbox-baby")
