local plugin = {
	name = "nvim-tree",
	opts = {
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
		renderer = {
			icons = {
				show = {
					git = false,
					modified = false,
				},
			},
		},
		git = {
			enable = false,
		},
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
	},
	keymaps = function()
		vim.keymap.set("n", "<leader>b", function()
			vim.cmd("NvimTreeFocus")
		end)
	end,
	aucmds = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
			pattern = "NvimTree_*",
			callback = function()
				local layout = vim.api.nvim_call_function("winlayout", {})
				if
					layout[1] == "leaf"
					and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
					and layout[3] == nil
				then
					vim.cmd("confirm quit")
				end
			end,
		})
	end,
}

return plugin
