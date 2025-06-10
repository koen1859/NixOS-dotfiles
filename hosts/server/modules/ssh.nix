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
    allowedTCPPorts = [22 9091 7878 8096];
    allowedUDPPorts = [51820];
  };
}
