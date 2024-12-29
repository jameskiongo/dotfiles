local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "UltraDark"
-- config.color_scheme = "Rapture"
-- config.color_scheme = "Paul Millr (Gogh)"
-- config.color_scheme = "Hemisu Dark (Gogh)"
config.enable_tab_bar = false

config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.5
config.macos_window_background_blur = 0
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 50,
	right = 50,
	top = 50,
	bottom = 50,
}
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
	-- Disable the Ctrl-click down event to stop programs from seeing it when a URL is clicked
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.Nop,
	},
}
config.keys = {
	{
		key = "C",
		mods = "CTRL",
		-- action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
		action = wezterm.action.CopyTo("Clipboard"),
	},
	-- paste from the clipboard

	{ key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },

	-- paste from the primary selection

	{ key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("PrimarySelection") },
}
config.font = wezterm.font("MesloLGS Nerd Font Mono", {
	-- config.font = wezterm.font("VictorMono Nerd Font", {
	weight = "Medium",
	italic = false,
})
config.font_size = 13
return config
