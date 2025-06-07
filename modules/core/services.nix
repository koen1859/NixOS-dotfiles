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
      enable = true;
      settings = {
        default_session = {
          user = "koenstevens";
          command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
        };
      };
    };
    displayManager.sddm = {
      enable = false;
      wayland.enable = true;
      theme = "${pkgs.sddm-sugar-dark}/share/sddm/themes/sugar-dark";
    };
  };
}
