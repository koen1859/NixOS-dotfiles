{
  inputs,
  pkgs,
  ...
}: let
  inherit (import ../variables.nix {inherit inputs pkgs;}) username;
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
          command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
        };
      };
    };
  };
}
