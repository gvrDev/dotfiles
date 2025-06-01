local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Monaspace Neon Medium")
config.color_scheme = "Builtin Tango Dark"
config.enable_wayland = true
config.cursor_blink_rate = 0
config.default_cursor_style = "SteadyBlock"
config.font_size = 12.5
config.line_height = 1.5
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 10,
	right = 0,
	top = 5,
	bottom = 0,
}
config.window_background_opacity = 0.75
config.default_prog = { "/bin/fish", "-l" }

return config
