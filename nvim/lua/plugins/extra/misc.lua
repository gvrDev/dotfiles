return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},

	{
		"numToStr/Comment.nvim",
		keys = {
			{
				"<leader>/",
				function()
					require("Comment.api").toggle.linewise.current()
				end,
				desc = "Comment current line",
				mode = "n",
			},
			{
				"<leader>/",
				"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
				desc = "Comment current selection",
				mode = "v",
			},
		},
	},
}
