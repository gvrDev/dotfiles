vim.opt.background = "dark"
-- vim.g.gruvbox_baby_background_color = "medium"
-- vim.g.gruvbox_baby_transparent_mode = "true"
-- vim.g.gruvbox_baby_telescope_theme = 0

vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_better_performance = 1

function ColorizeNVIM(color)
  color = color or "gruvbox-material"
  vim.cmd.colorscheme(color)
end

ColorizeNVIM()
