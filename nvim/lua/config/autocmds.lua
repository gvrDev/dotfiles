-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("ColorScheme", {
  command = [[highlight CursorLine guibg=NONE]],
})

vim.api.nvim_set_hl(0, "CursorLine", { underline = false })
