{
  pkgs,
  username,
  ...
}: {
  services = {
    blueman.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    libinput.enable = true;
    # greetd = {
    #   enable = true;
    #   settings = {
    #     default_session = {
    #       user = "${username}";
    #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland --time --user-menu --remember --remember-user-session";
    #     };
    #   };
    # };
    # displayManager.ly = {
    #   enable = true;
    #   settings = {
    #     session = "Hyprland";
    #   };
    # };
  };
}
