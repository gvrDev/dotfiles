return {
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-dadbod" },
	{ "kristijanhusak/vim-dadbod-ui" },
	{ "kristijanhusak/vim-dadbod-completion" },

	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>tu",
				function()
					vim.cmd.UndotreeToggle()
				end,
				desc = "Open undo tree",
			},
		},
	},

	{
		"ThePrimeagen/harpoon",
		keys = {
			{ "<leader>tha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add file to harpoon" },
			{ "<leader>th", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Open harpoon quickmenu" },
			{ "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Open first harpoon instance" },
			{ "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Open second harpoon instance" },
			{ "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Open third harpoon instance" },
			{ "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Open fourth harpoon instance" },
		},
	},

	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<leader>re",
				":Refactor extract<CR>",
				desc = "Extract to function",
				mode = "x",
			},
			{
				"<leader>rf",
				":Refactor extract_to_file<CR>",
				desc = "Extract to file",
				mode = "x",
			},
			{
				"<leader>rv",
				":Refactor extract_var<CR>",
				desc = "Extract var",
				mode = "x",
			},
			{
				"<leader>ri",
				":Refactor inline_var<CR>",
				desc = "Refactor inline_var",
				mode = { "x", "n" },
			},
			{
				"<leader>rb",
				":Refactor extract_block<CR>",
				desc = "Extract block",
				mode = "n",
			},
			{
				"<leader>rbf",
				":Refactor extract_block_to_file<CR>",
				desc = "Extract block to file",
				mode = "n",
			},
		},
	},
	{ "ThePrimeagen/git-worktree.nvim" },

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
				lazy = true,
			},
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

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
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("git_worktree")

			vim.keymap.set("n", "<leader>sf", function()
				builtin.find_files({ no_ignore = false, hidden = true })
			end, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>sg", function()
				builtin.live_grep()
			end, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>\\", function()
				builtin.buffers()
			end, { desc = "Show Buffers" })
			vim.keymap.set("n", "<leader>gw", function()
				require("telescope").extensions.git_worktree.git_worktrees()
			end, { desc = "Git worktrees" })
			vim.keymap.set("n", "<leader>gnw", function()
				require("telescope").extensions.git_worktree.create_git_worktree()
			end, { desc = "Git new worktree" })
		end,
	},

	{
		"nvimdev/guard.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvimdev/guard-collection",
		},
		config = function()
			local ft = require("guard.filetype")

			ft("typescript,javascript,jsx,tsx,javascriptreact,typescriptreact,vue,json,yaml,html"):fmt("prettier")
			ft("astro,svelte,cs,rust"):fmt("lsp")

			-- ft("lua"):fmt("stylua")

			ft("c,cpp"):fmt("lsp")

			ft("python"):fmt("black")

			require("guard").setup({
				fmt_on_save = true,
			})
		end,
	},

	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "pass show api/tokens/openai/nvim",
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	{ "wintermute-cell/gitignore.nvim" },

	{
		"m4xshen/hardtime.nvim",
		opts = {
			disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
		},
	},

	{ "stevearc/oil.nvim", opts = {
		view_options = {
			show_hidden = true,
		},
	} },
}
