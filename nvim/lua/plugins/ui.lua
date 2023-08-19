return {
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "MunifTanjim/nui.nvim", lazy = true },
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				signature = {
					enabled = false,
				},
				hover = {
					enabled = false,
				},
			},
		},
	},

	{ "folke/twilight.nvim" },

	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				tailwind = true,
				names = false,
			},
		},
	},

	-- {
	-- 	"shellRaining/hlchunk.nvim",
	-- 	event = "UIEnter",
	-- 	config = function()
	-- 		require("hlchunk").setup({
	-- 			indent = { enable = false },
	-- 			blank = { enable = false },
	--
	-- 			chunk = {
	-- 				chars = {
	-- 					horizontal_line = "─",
	-- 					vertical_line = "│",
	-- 					left_top = "╭",
	-- 					left_bottom = "╰",
	-- 					right_arrow = ">",
	-- 				},
	-- 				style = "#FFFFFF",
	-- 			},
	--
	-- 			line_num = { style = "#FFFFFF" },
	-- 		})
	-- 	end,
	-- },
}
