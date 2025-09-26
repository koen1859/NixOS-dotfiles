{pkgs, ...}: let
  start-dwl = pkgs.writeShellScriptBin "start-dwl" ''
    slstatus -s | dwl -s "sh -c 'hyprpaper &'"
  '';
in {
  environment.systemPackages = with pkgs; [
    wmenu
    grim
    slurp
    hyprpaper
    start-dwl
  ];
  programs = {
    dwl = {
      enable = true;
      package = pkgs.dwl.overrideAttrs (oldAttrs: {
        src = ./dwl;
        nativeBuildInputs =
          (oldAttrs.nativeBuildInputs or [])
          ++ [
          ];

        buildInputs =
          (oldAttrs.buildInputs or [])
          ++ [
            pkgs.wlroots_0_19
            pkgs.libdrm
            pkgs.fcft
          ];
      });
    };
  };
}
