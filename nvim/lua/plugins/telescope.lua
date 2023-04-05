return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build="cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
	},
	config = function()
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")

		local function telescope_buffer_dir()
			return vim.fn.expand("%:p:h")
		end

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
					hijack_netrw = true,
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

		vim.keymap.set("n", "<leader>cs", function()
			builtin.colorscheme({ enable_preview = true })
		end)
		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({
				no_ignore = false,
				hidden = true,
			})
		end)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>pg", function()
			builtin.live_grep()
		end)
		vim.keymap.set("n", "<leader>\\", function()
			builtin.buffers()
		end)
		vim.keymap.set("n", "<leader>fd", function()
			builtin.diagnostics()
		end)
		vim.keymap.set("n", "<leader>pf", function()
			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = telescope_buffer_dir(),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_config = { height = 40 },
			})
		end, { noremap = true })
	end,
}
