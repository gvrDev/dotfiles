return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true, },
				sync_install = false,
				auto_install = true,
				ensure_installed = {
					"typescript",
					"toml",
					"json",
					"yaml",
					"css",
					"html",
					"lua",
					"rust",
					"bash",
					"svelte",
					"tsx",
					"jsdoc",
					"markdown",
				},
				ignore_install = { "javascript" },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['ai'] = '@conditional.outer',
              ['ii'] = '@conditional.inner',
              ['al'] = '@loop.outer',
              ['il'] = '@loop.inner',
            }
          }
        }
			})
		end,
	},
}
