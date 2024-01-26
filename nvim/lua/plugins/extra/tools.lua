return {
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},

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

			vim.keymap.set("n", "<leader>sf", function()
				builtin.find_files({ no_ignore = false, hidden = true })
			end, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>sg", function()
				builtin.live_grep()
			end, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>\\", function()
				builtin.buffers()
			end, { desc = "Show Buffers" })
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				astro = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
				jsx = { { "prettierd", "prettier" } },
				tsx = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				vue = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				astro = { "eslint_d" },
				svelte = { "eslint_d" },
				jsx = { "eslint_d" },
				tsx = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	{
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		keys = {
			{
				"<leader>.",
				"<CMD>Oil<CR>",
				desc = "Open Oil",
				mode = "n",
			},
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signcolumn = true,
		},
	},

	{
		"christoomey/vim-tmux-navigator",
		config = function()
			vim.keymap.set("n", "<M-h>", ":<C-U>TmuxNavigateLeft<cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "<M-l>", ":<C-U>TmuxNavigateRight<cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "<M-j>", ":<C-U>TmuxNavigateDown<cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "<M-k>", ":<C-U>TmuxNavigateUp<cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "<M-\\>", ":<C-U>TmuxNavigatePrevious<cr>", { noremap = true, silent = true })
		end,
	},

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.summary"] = {}, -- Adds pretty icons to your documents
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
							},
						},
					},
				},
			})
		end,
	},
}
