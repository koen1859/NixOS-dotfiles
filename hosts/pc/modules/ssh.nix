{
  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
        Port = 2222;
      };
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [2222];
  };
}
