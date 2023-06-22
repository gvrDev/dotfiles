return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{
			"<leader>cs",
			function()
				require("telescope.builtin").colorscheme({ enable_preview = true })
			end,
			desc = "Colorscheme list",
			mode = "n",
		},
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({ no_ignore = false, hidden = true })
			end,
			desc = "Find files",
			mode = "n",
		},
		{
			"<leader>gs",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
			end,
			desc = "Search using Grep",
			mode = "n",
		},
		{
			"<leader>pg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Live Grep",
			mode = "n",
		},
		{
			"<leader>\\",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Show Buffers",
			mode = "n",
		},
		{
			"<leader>fd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "Show diagnostics",
			mode = "n",
		},
		{
			"<leader>pf",
			function()
				require("telescope").extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = vim.fn.expand("%:p:h"),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 40 },
				})
			end,
			desc = "File browser",
			mode = "n",
		},
	},
	dependencies = {
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")

		local fb_actions = telescope.extensions.file_browser.actions

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				file_browser = {
					theme = "dropdown",
					grouped = true,
					hide_parent_dir = true,
					hidden = true,
					mappings = {
						["n"] = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
			},
		})

		telescope.load_extension("file_browser")
		telescope.load_extension("fzf")
	end,
}
