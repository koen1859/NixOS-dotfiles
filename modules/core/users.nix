{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.bash;
    users.koenstevens = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      packages = with pkgs; [
        tree
      ];
    };
  };
}
