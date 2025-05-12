{pkgs, ...}: {
  services = {
    blueman.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    libinput.enable = true;
    flatpak = {
      enable = true;
    };
    greetd = {
      enable = false;
      vt = 3;
      settings = {
        default_session = {
          user = "koenstevens";
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        };
      };
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${pkgs.sddm-sugar-dark}/share/sddm/themes/sugar-dark";
    };
  };
}
