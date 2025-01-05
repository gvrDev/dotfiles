local wezterm = require("wezterm")

return {
	color_scheme = "Catppuccin Mocha",
	font = wezterm.font("Monaspace Neon Medium"),
	font_size = 12.5,
	line_height = 1.5,

	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
	},
	max_fps = 240,

	default_prog = { "fish" },
}
