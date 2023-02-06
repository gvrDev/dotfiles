-- vim.g.everforest_better_performance = 1
-- vim.g.everforest_transparent_background = true
-- vim.g.everforest_background = "soft"

function ColorizeNVIM(color)
	color = color
	vim.cmd.colorscheme(color)
end

ColorizeNVIM("gruvbox")
