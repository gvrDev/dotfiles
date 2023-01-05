vim.opt.background = "dark"
vim.g.gruvbox_baby_background_color = "medium"
vim.g.gruvbox_baby_transparent_mode = "true"
vim.g.gruvbox_baby_telescope_theme = 0

function ColorizeNVIM(color)
	color = color or "gruvbox-baby"
	vim.cmd.colorscheme(color)
end

ColorizeNVIM()
