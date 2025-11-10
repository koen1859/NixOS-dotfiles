{config, ...}: {
  services = {
    fail2ban = {
      enable = true;
    };
    openssh = {
      enable = true;
      authorizedKeysFiles = [config.sops.secrets.ssh_public_key.path];
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "no";
      };
      ports = [21];
      openFirewall = true;
    };
  };
}
