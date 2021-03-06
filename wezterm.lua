local wezterm = require 'wezterm';

local customKeys = {
  {key="LeftArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
  {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=1}},
  {key="LeftArrow", mods="CTRL", action="DisableDefaultAssignment"},
  {key="RightArrow", mods="CTRL", action="DisableDefaultAssignment"},
  {key="q", mods="CTRL|SHIFT|ALT",action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  {key="w", mods="CTRL|SHIFT|ALT",action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  {key="q", mods="CTRL", action="QuitApplication"},
  {key="H", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Left", 1}}},
  {key="J", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Down", 1}}},
  {key="K", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
  {key="L", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Right", 1}}},
  {key="LeftArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Left", 1}}},
  {key="DownArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Down", 1}}},
  {key="UpArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
  {key="RightArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Right", 1}}},
  {key="w", mods="CTRL", action=wezterm.action{CloseCurrentPane={confirm=true}}},
  {key="{", mods="SHIFT|ALT", action=wezterm.action{MoveTabRelative=-1}},
  {key="}", mods="SHIFT|ALT", action=wezterm.action{MoveTabRelative=1}},
  -- {event={Up={streak=1, button="Left"}}, mods="CTRL", action="OpenLinkAtMouseCursor",},
  -- {event={Up={streak=1, button="Left"}}, mods="ALT", action="OpenLinkAtMouseCursor",},
  {key="PageUp", mods="CTRL", action=wezterm.action{ScrollByLine=-1}},
  {key="PageDown", mods="CTRL", action=wezterm.action{ScrollByLine=1}},
  {key="h", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Left"}},
  {key="j", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Down"}},
  {key="k", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Up"}},
  {key="l", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Right"}},
  {key="LeftArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
  {key="DownArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Down"}},
  {key="UpArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Up"}},
  {key="RightArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Right"}},
  {key="Tab", mods="CTRL", action="ActivateLastTab"},
  {key="q", mods="CTRL", action="DisableDefaultAssignment"},
  {key="q", mods="CTRL|SHIFT", action="DisableDefaultAssignment"},
  {key="f", mods="CTRL", action=wezterm.action{Search={CaseInSensitiveString=""}}},
  {key="f", mods="CTRL|SHIFT", action=wezterm.action{Search={CaseSensitiveString=""}}},
  {key="f", mods="CTRL|SHIFT|ALT", action=wezterm.action{Search={Regex=""}}},
  -- {key="1", mods="ALT", action=wezterm.action{ActivateTab=0}},
  -- {key="2", mods="ALT", action=wezterm.action{ActivateTab=1}},
  -- {key="3", mods="ALT", action=wezterm.action{ActivateTab=2}},
  -- {key="4", mods="ALT", action=wezterm.action{ActivateTab=3}},
  -- {key="5", mods="ALT", action=wezterm.action{ActivateTab=4}},
  -- {key="6", mods="ALT", action=wezterm.action{ActivateTab=5}},
  -- {key="7", mods="ALT", action=wezterm.action{ActivateTab=6}},
  -- {key="8", mods="ALT", action=wezterm.action{ActivateTab=7}},
  -- {key="9", mods="ALT", action=wezterm.action{ActivateTab=8}},
  -- {key="0", mods="ALT", action=wezterm.action{ActivateTab=9}},

  -- new versions only
  {key="Backspace", mods="CTRL", action={SendKey={key="w", mods="CTRL"}}},
}

for i = 1, 9 do
  table.insert(customKeys, {key=tostring(i), mods="ALT", action=wezterm.action{ActivateTab=i-1},})
end

return {
  font = wezterm.font_with_fallback({
    "Monofur Nerd Font",
    "MesloLGS Nerd Font",
    "FiraCode Nerd Font"
  }),
  font_size = 20,
  color_scheme = "Monokai Remastered",
  scrollback_lines = 35000,
  enable_scroll_bar = true,
  -- disable_default_key_bindings = true,
  debug_key_events = true,
  default_cursor_style = "SteadyBar",

  keys = customKeys
}
