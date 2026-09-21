local wezterm = require("wezterm")
local sessionizer = require("sessionizer")

local config = wezterm.config_builder()

config.font_size = 13
config.font = wezterm.font("Fira Code")
config.default_prog = { "fish", "-l" }
config.color_scheme = "Tokyo Night"
config.max_fps = 999
config.animation_fps = 240
config.audible_bell = "Disabled"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_frame = {
	font = wezterm.font({ family = "Roboto", weight = "Bold" }),
	font_size = 11,
}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "t",
		mods = "ALT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "x",
		mods = "ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "q",
		mods = "ALT",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},

	-- VIM BINDINGS MOVEMENT
	{
		key = "h",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},

	-- VIM BINDINGS RESIZE
	{
		key = "h",
		mods = "ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 2 }),
	},
	{
		key = "j",
		mods = "ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 2 }),
	},
	{
		key = "k",
		mods = "ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 2 }),
	},
	{
		key = "l",
		mods = "ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 2 }),
	},

	{
		key = "n",
		mods = "ALT",
		action = wezterm.action_callback(sessionizer.toggle),
	},
	{
		key = "g",
		mods = "LEADER",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "lazygit" },
		}),
	},
}

for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
