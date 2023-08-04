local wezterm = require("wezterm")
local config = {}

config.colors = {
	background = "#161616",
	foreground = "#ffffff",
	cursor_bg = "#ffffff",
	cursor_border = "#ffffff",
	cursor_fg = "#161616",

	ansi = {
		"#262626",
		"#ee5396",
		"#42be65",
		"#ffe97b",
		"#33b1ff",
		"#ff7eb6",
		"#3ddbd9",
		"#dde1e6",
	},
	brights = {
		"#393939",
		"#ee5396",
		"#42be65",
		"#ffe97b",
		"#33b1ff",
		"#ff7eb6",
		"#3ddbd9",
		"#ffffff",
	},
}

config.font = wezterm.font({
	family = "JetBrainsMono NerdFont",
})
config.font_size = 14

config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

config.default_prog = { "/usr/bin/zsh" }

return config
