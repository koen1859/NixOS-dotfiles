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
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --user-menu --remember --cmd mango";
        };
      };
    };
  };
  systemd.tmpfiles.rules = ["L /usr/bin/which - - - - ${pkgs.which}/bin/which"];
}
