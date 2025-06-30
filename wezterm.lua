-- Pull in Wezterm API
local wezterm = require("wezterm")
-- Config holder
local config = wezterm.config_builder()
local scheme = "nord"
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]

-- Configs
-- config.font = wezterm.font("MonaspiceNE Nerd Font Mono")
config.font_size = 11
config.window_decorations = "NONE"
config.color_scheme = scheme
config.tab_bar_at_bottom = true
config.window_padding = { left = 2, right = 2, top = 0, bottom = -5 }
config.use_fancy_tab_bar = false
config.max_fps = 144
config.prefer_egl = true

-- Key bindings --
config.disable_default_key_bindings = true
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
    {
        key = '%',
        mods = "LEADER|SHIFT",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } ,
    },
    {
        key = '"',
        mods = "LEADER|SHIFT",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } ,
    },
    {
        key = "1",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(0),
    },
    {
        key = "2",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(1),
    },
    {
        key = "3",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(2),
    },
    {
        key = "4",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(3),
    },
    {
        key = "5",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(4),
    },
    {
        key = "6",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(5),
    },
    {
        key = "7",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(6),
    },
    {
        key = "8",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(7),
    },
    {
        key = "9",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(8),
    },
    {
        key = "c",
        mods = "LEADER",
        action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
    {
        key = "x",
        mods = "LEADER",
        action = wezterm.action.CloseCurrentTab { confirm = true },
    },
    {
        key = "LeftArrow",
        mods = "LEADER",
        action = wezterm.action.AdjustPaneSize { "Left", 1 },
    },
    {
        key = "RightArrow",
        mods = "LEADER",
        action = wezterm.action.AdjustPaneSize { "Right", 1 },
    },
    {
        key = "UpArrow",
        mods = "LEADER",
        action = wezterm.action.AdjustPaneSize { "Up", 1 },
    },
    {
        key = "DownArrow",
        mods = "LEADER",
        action = wezterm.action.AdjustPaneSize { "Down", 1 },
    },
    {
        key = "h",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection("Left"),
    },
    {
        key = "l",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection("Right"),
    },
    {
        key = "k",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection("Up"),
    },
    {
        key = "j",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection("Down"),
    },
    {
        key = "}",
        mods = "LEADER|SHIFT",
        action = wezterm.action.RotatePanes("Clockwise"),
    },
    {
        key = "{",
        mods = "LEADER|SHIFT",
        action = wezterm.action.RotatePanes("CounterClockwise"),
    },
    {
        key = "x",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivateCopyMode,
    },
    {
        key = "c",
        mods = "CTRL|SHIFT",
        action = wezterm.action.CopyTo('Clipboard'),
    },
    {
        key = "v",
        mods = "CTRL|SHIFT",
        action = wezterm.action.PasteFrom('Clipboard')
    },
}

-- Fancy tab bar config --
config.window_frame = {
    active_titlebar_bg = scheme_def.background,
    inactive_titlebar_bg = scheme_def.background,
    border_bottom_height = '0',
}

-- Retro tab bar config --
config.colors = {
    tab_bar = {
        background = scheme_def.background,
        active_tab = {
            bg_color = scheme_def.selection_bg,
            fg_color = scheme_def.selection_fg,
        },
        inactive_tab = {
            bg_color = scheme_def.background,
            fg_color = scheme_def.foreground,
        },
        inactive_tab_edge = "#575757"
    }
}


return config
