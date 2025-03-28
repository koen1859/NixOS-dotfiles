_: {
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    timeout = 30;
    efi.canTouchEfiVariables = true;
  };
}
