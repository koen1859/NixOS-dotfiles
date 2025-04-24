_: {
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        sensitivity = 0.0;
      };
      bind = [
        "SUPER_SHIFT, S, exec, hyprshot -m output -m eDP-1"
      ];
    };
  };

  programs.bash.shellAliases = {
    reconfig = "home-manager switch --flake ~/.dotfiles#laptop";
  };
  programs.zsh.shellAliases = {
    reconfig = "home-manager switch --flake ~/.dotfiles#laptop";
  };
}
