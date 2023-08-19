return {
	{ "tpope/vim-fugitive" },

	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>u",
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
			{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add file to harpoon" },
			{ "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Open harpoon quickmenu" },
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
			{ "nvim-telescope/telescope-file-browser.nvim", lazy = true },
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
			telescope.load_extension("git_worktree")

			vim.keymap.set("n", "<leader>pf", function()
				builtin.find_files({ no_ignore = false, hidden = true })
			end, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>pg", function()
				builtin.live_grep()
			end, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>\\", function()
				builtin.buffers()
			end, { desc = "Show Buffers" })
			vim.keymap.set("n", "<leader>pd", function()
				builtin.diagnostics()
			end, { desc = "Show Diagnostics" })
			vim.keymap.set("n", "<leader>.", function()
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
			end, { desc = "File browser" })
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
		config = function()
			local ft = require("guard.filetype")

			ft("jsx,tsx,javascript,typescript,javascriptreact,typescriptreact,vue,html,json,yaml"):fmt("prettierd")
			ft("svelte,cs"):fmt("lsp")

			ft("lua"):fmt("stylua")

			ft("c,cpp"):fmt("clang-format"):lint("clang-tidy")

			ft("rust"):fmt("rust-fmt")

			ft("python"):fmt("black")

			require("guard").setup({
				fmt_on_save = true,
			})
		end,
	},

	{
		"pmizio/typescript-tools.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			settings = {
				expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
			},
		},
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
}
