{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) username;
in {
  services = {
    blueman.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    libinput.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          user = "${username}";
          command = "${pkgs.tuigreet}/bin/tuigreet --cmd Hyprland --time --user-menu --remember --remember-user-session";
        };
      };
    };
  };
}
