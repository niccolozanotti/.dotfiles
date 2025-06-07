-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Reference : https://wezterm.org/config/files.html#configuration-file-structure
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

-- Enable OSC 52 clipboard integration
config.enable_csi_u_key_encoding = true
config.enable_kitty_keyboard = true

-- Allow programs to write to clipboard
config.allow_win32_input_mode = true

return config
