-- FZF
local fzf = require("fzf-lua")
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

vim.keymap.set("n", "<leader>bd", require("mini.bufremove").delete, { silent = true })

-- HARPOON
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
