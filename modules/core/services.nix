{pkgs, ...}: {
  services = {
    blueman.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    printing.enable = true;
    libinput.enable = true;
    xserver.enable = true;
    greetd = {
      enable = false;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --user-menu --remember --cmd mango";
        };
      };
    };
    displayManager.gdm.enable = true;
  };
  systemd.tmpfiles.rules = ["L /usr/bin/which - - - - ${pkgs.which}/bin/which"];
}
