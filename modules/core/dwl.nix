{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wmenu
    wl-clipboard
    grim
    slurp
    hyprpaper
  ];
  programs = {
    dwl = {
      enable = true;
      extraSessionCommands = ''
        ${pkgs.hyprpaper}/bin/hyprpaper &
        slstatus -s &
      '';
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
