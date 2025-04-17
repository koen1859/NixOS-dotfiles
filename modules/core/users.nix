{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.bash;
    users.koenstevens = {
      isNormalUser = true;
      extraGroups = ["wheel" "libvirtd"];
      packages = with pkgs; [
        tree
      ];
    };
  };
}
