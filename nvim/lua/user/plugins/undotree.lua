local plugin = {
	setup = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end,
}

return plugin
