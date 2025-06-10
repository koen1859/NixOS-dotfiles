{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.bash;
    users.koenstevens = {
      isNormalUser = true;
      extraGroups = ["wheel" "libvirtd"];
    };
  };
  security.sudo.extraRules = [
    {
      users = ["koenstevens"];
      commands = [
        {
          command = "/run/current-system/sw/bin/wg-quick";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
}
