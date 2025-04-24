{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.zsh;
    users.koenstevens = {
      isNormalUser = true;
      extraGroups = ["wheel" "libvirtd"];
      packages = with pkgs; [
        tree
      ];
    };
  };
}
