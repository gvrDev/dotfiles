return {
	"christoomey/vim-tmux-navigator",
	keys = {
		{
			"<C-h>",
			function()
				vim.cmd("<cmd>TmuxNavigateLeft<cr>")
			end,
			desc = "Tmux navigate left",
			mode = "n",
		},
		{
			"<C-j>",
			function()
				vim.cmd("<cmd>TmuxNavigateDown<cr>")
			end,
			desc = "Tmux navigate down",
			mode = "n",
		},
		{
			"<C-k>",
			function()
				vim.cmd("<cmd>TmuxNavigateUp<cr>")
			end,
			desc = "Tmux navigate up",
			mode = "n",
		},
		{
			"<C-l>",
			function()
				vim.cmd("<cmd>TmuxNavigateRight<cr>")
			end,
			desc = "Tmux navigate right",
			mode = "n",
		},
	},
}
