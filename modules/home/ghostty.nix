{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
  };
  home.file."./.config/ghostty/config".text = ''
    adjust-cell-height = 10%
    cursor-style = bar
    mouse-hide-while-typing = true

    # keybindings
    keybind = alt+r=reload_config
    keybind = alt+q=close_surface
    keybind = alt+shift+q=close_tab

    keybind = alt+n=new_window

    # tabs
    keybind = alt+t=new_tab
    keybind = alt+tab=next_tab
    keybind = alt+shift+tab=previous_tab
    keybind = alt+comma=move_tab:-1
    keybind = alt+period=move_tab:1

    # quick tab switch
    keybind = alt+1=goto_tab:1
    keybind = alt+2=goto_tab:2
    keybind = alt+3=goto_tab:3
    keybind = alt+4=goto_tab:4
    keybind = alt+5=goto_tab:5
    keybind = alt+6=goto_tab:6
    keybind = alt+7=goto_tab:7
    keybind = alt+8=goto_tab:8
    keybind = alt+9=goto_tab:9

    # split
    keybind = alt+p=new_split:right
    keybind = alt+-=new_split:down

    keybind = alt+j=goto_split:bottom
    keybind = alt+k=goto_split:top
    keybind = alt+h=goto_split:left
    keybind = alt+l=goto_split:right

    keybind = alt+z=toggle_split_zoom

    keybind = alt+e=equalize_splits

    # other
    copy-on-select = clipboard

    # font-size = 12
    # font-family = JetBrainsMono Nerd Font Mono
    # font-family-bold = JetBrainsMono NFM Bold
    # font-family-bold-italic = JetBrainsMono NFM Bold Italic
    # font-family-italic = JetBrainsMono NFM Italic

    title = "GhosTTY"

    shell-integration = detect
    shell-integration-features = cursor,sudo
  '';
}
