local status, tree = pcall(require, "nvim-tree")
if not status then
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
	view = {
		adaptive_size = true,
		side = "right",
		mappings = {
			list = {
				{ key = "h", action = "parent_node" },
				{ key = "N", action = "create" },
			},
		},
	},
	filters = {
		custom = { "^\\.git", "^\\.vscode" },
	},
})

vim.keymap.set("n", "<leader>b", function()
	vim.cmd("NvimTreeToggle")
end)
vim.keymap.set("n", "<leader>e", function()
	vim.cmd("NvimTreeFocus")
end)

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
			vim.cmd("quit")
		end
	end,
})
