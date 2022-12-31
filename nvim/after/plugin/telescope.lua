local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {},
})

vim.keymap.set("n", "<leader>pf", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>pg", function()
	builtin.live_grep()
end)
vim.keymap.set("n", "<leader>//", function()
	builtin.buffers()
end)
vim.keymap.set("n", "<leader>fd", function()
	builtin.diagnostics()
end)
