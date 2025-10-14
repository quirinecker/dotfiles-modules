local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.color_scheme = 'nightfox'
-- config.default_cwd = '~/.config'
config.window_decorations = 'NONE'
config.enable_tab_bar = false
config.default_prog = { 'fish' }
config.enable_wayland = false
config.front_end = 'WebGpu'
config.colors = {
	background = 'rgba(43 48 59 50%)'
}
config.automatically_reload_config = false

return config
