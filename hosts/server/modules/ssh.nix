{
  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
        Port = 22;
      };
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22];
  };
}
