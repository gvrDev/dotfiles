return {
	"jose-elias-alvarez/typescript.nvim",
	event = "BufReadPre",
	opts = {
		disable_commands = false,
		debug = false,
		go_to_source_definition = {
			fallback = true,
		},
		servers = {
			tsserver = {
				settings = {
					completions = {
						compeleteFunctionCalls = true,
					},
				},
			},
		},
	},
}
