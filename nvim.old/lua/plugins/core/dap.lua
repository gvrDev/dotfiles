return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{ "mfussenegger/nvim-dap", lazy = true },
			{ "theHamsta/nvim-dap-virtual-text", lazy = true },
			{
				"jay-babu/mason-nvim-dap.nvim",
				opts = {
					automatic_setup = true,
					handlers = {},
				},
			},
		},
		config = function()
			require("dapui").setup({})
		end,
		keys = {
			{
				"<leader>td",
				"<cmd>lua require('dapui').toggle('sidebar')<cr>",
				desc = "Toggle Dap ui",
				mode = "n",
			},
			{
				"<leader>dc",
				"<cmd>DapContinue<cr>",
				desc = "Dap Continue",
				mode = "n",
			},
			{
				"<leader>db",
				"<cmd>DapToggleBreakpoint<cr>",
				desc = "Dap Toggle Breakpoint",
				mode = "n",
			},
		},
	},
}
