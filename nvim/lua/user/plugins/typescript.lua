local plugin = {
	name = "typescript",
	opts = {
		disable_commands = false,
		debug = false,
		go_to_source_definition = {
			fallback = true,
		},
		server = {},
	},
}

return plugin
