{
  services = {
    fail2ban = {
      enable = true;
    };
    openssh = {
      enable = true;
      hostKeys = [];
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
