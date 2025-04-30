{pkgs, ...}: {
  services = {
    blueman.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    libinput.enable = true;
    # postgresql = {
    #   enable = true;
    #   package = pkgs.postgresql_17;
    #   dataDir = "/var/lib/postgresql/data";
    #   extensions = with pkgs.postgresql17Packages; [postgis];
    #   authentication = ''
    #     local   all             all                                     trust
    #     host    all             all             127.0.0.1/32            trust
    #     host    all             all             ::1/128                 trust
    #   '';
    # };
    flatpak = {
      enable = true;
    };
    greetd = {
      enable = true;
      vt = 3;
      settings = {
        default_session = {
          user = "koenstevens";
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        };
      };
    };
    # services.printing.enable = true;
  };
}
