{
  home.file."./.config/wezterm/BSc_Thesis.lua".text = ''
    local wezterm = require 'wezterm'

    wezterm.on("trigger-spawn-tabs", function(window, pane)
      local project_dir = "/home/youruser/your/project/path"

      window:perform_action(wezterm.action.SpawnTab("CurrentPaneDomain"), pane)
      window:perform_action(wezterm.action.SendKey({key="c", mods="CTRL"}), pane)
      window:perform_action(wezterm.action.SendString("cd " .. project_dir .. " && nvim\n"), pane)

      local tab2 = window:spawn_tab {}
      local pane2 = tab2:active_pane()
      pane2:send_text("cd " .. project_dir .. " && devenv up --detach\n")
    end)

    return {
      keys = {
        {
          key = "T",
          mods = "CTRL|SHIFT",
          action = wezterm.action.EmitEvent("trigger-spawn-tabs"),
        },
      },
    }
  '';
}
