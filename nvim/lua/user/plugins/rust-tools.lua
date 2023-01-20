local plugin = {
	setup = function()
		local rt = require("rust-tools")

		rt.setup({
			server = {
				settings = {
					["rust-analyzer"] = {
						procMacro = { enable = true },
					},
				},
			},
		})
	end,
}

return plugin
