{config, ...}: {
  networking.firewall.allowedTCPPorts = [22 2222];
  services = {
    fail2ban = {
      enable = true;
    };
    openssh = {
      enable = true;
      authorizedKeysFiles = [config.sops.secrets.ssh_public_key.path];
      ports = [22 2222];
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
