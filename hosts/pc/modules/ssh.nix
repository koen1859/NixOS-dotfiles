{
  services = {
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
