local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

local current_dir = os.getenv("PWD") or os.getenv("OLDPWD")

config.default_prog = { "pwsh.exe", "-nologo" }
config.default_cwd = current_dir

-- Themes
local scheme = "Catppuccin Mocha"
config.color_scheme = scheme
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]
local bg_custom = "#1e1e2e"
local bg_color = bg_custom
local fg_inactive = "#565f89"
local bg_newtab = "#24283b"

config.colors = {
    background = bg_color,
    tab_bar = {
        active_tab = {
            bg_color = bg_color,
            fg_color = scheme_def.foreground,
        },
        inactive_tab = {
            bg_color = "#181825",
            fg_color = fg_inactive,
        },
        inactive_tab_edge = bg_custom,
        new_tab = {
            bg_color = bg_newtab,
            fg_color = scheme_def.foreground,
        },
        inactive_tab_hover = {
            bg_color = "#181825",
            fg_color = scheme_def.foreground,
        },
    },
}

config.window_background_opacity = 1

config.window_frame = {
    active_titlebar_bg = "#181825",
    inactive_titlebar_bg = "#181825",
}

config.tab_max_width = 16
config.tab_bar_at_bottom = false
config.disable_default_key_bindings = true
config.adjust_window_size_when_changing_font_size = false
config.audible_bell = "Disabled"
config.exit_behavior = "Close"
config.window_padding = {
    left = 5,
    right = 5,
    top = 10,
    bottom = 10,
}
config.initial_cols = 120
config.initial_rows = 30
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.show_tab_index_in_tab_bar = false
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
config.scrollback_lines = 10000
-- config.show_update_window = true
config.use_dead_keys = false
config.unicode_version = 15
config.macos_window_background_blur = 100
config.window_close_confirmation = "NeverPrompt"

-- config.default_cursor_style = "BlinkingBlock"
-- config.cursor_blink_rate = 600
-- config.force_reverse_video_cursor = false

config.harfbuzz_features = { "liga=1" }
config.font = wezterm.font({
    family = "CaskaydiaMono NF",
    weight = 600,
    stretch = "Normal",
    style = "Normal",
    harfbuzz_features = { "cv29", "cv30", "ss01", "ss03", "ss06", "ss07", "ss09" },
})
config.freetype_load_flags = "NO_HINTING"
config.front_end = "WebGpu" -- WebGpu, OpenGL or Software
config.font_size = 12
config.line_height = 1.0
config.hide_mouse_cursor_when_typing = true

-- add keys mapping
config.keys = {
    { action = wezterm.action.ActivateCommandPalette, mods = "CTRL|SHIFT", key = "P" },
    { action = wezterm.action.CopyTo("Clipboard"),    mods = "CTRL|SHIFT", key = "C" },
    { action = wezterm.action.DecreaseFontSize,       mods = "CTRL",       key = "-" },
    { action = wezterm.action.IncreaseFontSize,       mods = "CTRL",       key = "=" },
    { action = wezterm.action.Nop,                    mods = "ALT",        key = "Enter" },
    { action = wezterm.action.PasteFrom("Clipboard"), mods = "CTRL|SHIFT", key = "V" },
    { action = wezterm.action.ResetFontSize,          mods = "CTRL",       key = "0" },
    { action = wezterm.action.ToggleFullScreen,       key = "F11" },
    -- open new tab
    {
        action = wezterm.action.SpawnCommandInNewTab({ args = { "pwsh.exe", "-nologo" }, cwd = current_dir }),
        mods = "CTRL|SHIFT",
        key = "T",
    },
    -- close active tab
    {
        action = wezterm.action.CloseCurrentTab({ confirm = false }),
        mods = "CTRL",
        key = "d",
    },
    -- open new window ctrl+shift+n
    {
        action = wezterm.action.SpawnCommandInNewWindow({ args = { "pwsh.exe", "-nologo" }, cwd = current_dir }),
        mods = "ALT|SHIFT",
        key = "N",
    },
    -- rename table title
    {
        action = act.PromptInputLine({
            description = "Enter new name for tab",
            action = wezterm.action_callback(function(window, pane, line)
                -- line will be `nil` if they hit escape without entering anything
                -- An empty string if they just hit enter
                -- Or the actual line of text they wrote
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        }),
        mods = "CTRL|SHIFT",
        key = "R",
    },
    -- move tab relative to left shift+alt+{
    { key = "LeftArrow",  mods = "CTRL|ALT",   action = act.MoveTabRelative(-1) },
    -- move tab relative to right shift+alt+}
    { key = "RightArrow", mods = "CTRL|ALT",   action = act.MoveTabRelative(1) },
    -- add tab navigation ctrl+PageUp
    { key = "LeftArrow",  mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
    -- add tab navigation ctrl+PageDown
    { key = "RightArrow", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
    -- add split vertical ctrl+shift+v
    { key = "V",          mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    -- add split horizontal ctrl+shift+h
    { key = "H",          mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    -- delete split ctrl+shift+d
    { key = "D",          mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },
    -- navigate focus panel up alt+up
    { key = "UpArrow",    mods = "ALT",        action = act.ActivatePaneDirection("Up") },
    -- navigate focus panel down alt+down
    { key = "DownArrow",  mods = "ALT",        action = act.ActivatePaneDirection("Down") },
    -- navigate focus panel left alt+left
    { key = "LeftArrow",  mods = "ALT",        action = act.ActivatePaneDirection("Left") },
    -- navigate focus panel right alt+right
    { key = "RightArrow", mods = "ALT",        action = act.ActivatePaneDirection("Right") },
    -- resize panel up alt+shift+up
    { key = "UpArrow",    mods = "ALT|SHIFT",  action = act.AdjustPaneSize({ "Up", 1 }) },
    -- resize panel down alt+shift+down
    { key = "DownArrow",  mods = "ALT|SHIFT",  action = act.AdjustPaneSize({ "Down", 1 }) },
    -- resize panel left alt+shift+left
    { key = "LeftArrow",  mods = "ALT|SHIFT",  action = act.AdjustPaneSize({ "Left", 1 }) },
    -- resize panel right alt+shift+right
    { key = "RightArrow", mods = "ALT|SHIFT",  action = act.AdjustPaneSize({ "Right", 1 }) },
    -- key alt + UpArrow will send string ALT + k
    { key = "UpArrow",    mods = "ALT",        action = act.SendKey({ key = "k", mods = "ALT" }) },
    -- key alt + DownArrow will send string ALT + j
    { key = "DownArrow",  mods = "ALT",        action = act.SendKey({ key = "j", mods = "ALT" }) },
    -- key alt + LeftArrow will send string ALT + LeftArrow
    { key = "LeftArrow",  mods = "ALT",        action = act.SendKey({ key = "LeftArrow", mods = "ALT" }) },
    -- key alt + RightArrow will send string ALT + RightArrow
    { key = "RightArrow", mods = "ALT",        action = act.SendKey({ key = "RightArrow", mods = "ALT" }) },
    -- set for duplicate key vscode shift-alt-up
    { key = "UpArrow",    mods = "SHIFT|ALT",  action = act.SendKey({ key = "UpArrow", mods = "SHIFT" }) },
    -- set for duplicate key vscode shift-alt-down
    { key = "DownArrow",  mods = "SHIFT|ALT",  action = act.SendKey({ key = "DownArrow", mods = "SHIFT" }) },
    {
        key = "X",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ""
            if has_selection then
                window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)

                window:perform_action(act.ClearSelection, pane)
            else
                window:perform_action(act.SendKey({ key = "x", mods = "CTRL" }), pane)
            end
        end),
    },
    {
        key = "C",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window, pane)
            local sel = window:get_selection_text_for_pane(pane)
            if not sel or sel == "" then
                window:perform_action(wezterm.action.SendKey({ key = "c", mods = "CTRL" }), pane)
            else
                window:perform_action(wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }), pane)
            end
        end),
    },
}

-- add mouse keys mapping
config.mouse_bindings = {
    {
        event = { Drag = { streak = 1, button = "Left" } },
        mods = "SUPER",
        action = wezterm.action.StartWindowDrag,
    },
    -- drag drop window CTRL + Mouse Left
    {
        event = { Drag = { streak = 1, button = "Left" } },
        mods = "CTRL|SHIFT",
        action = wezterm.action.StartWindowDrag,
    },
    -- shift-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "SHIFT",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
}

return config
