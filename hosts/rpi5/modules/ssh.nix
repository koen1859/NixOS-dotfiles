{config, ...}: {
  services = {
    fail2ban = {
      enable = true;
    };
    openssh = {
      enable = true;
      authorizedKeysFiles = [config.sops.secrets.ssh_public_key.path];
      ports = 2222;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
