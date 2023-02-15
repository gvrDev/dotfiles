local plugin = {
	setup = function()
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
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
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
			vim.cmd("Telescope file_browser")
		end, { noremap = true })
	end,
}

return plugin
