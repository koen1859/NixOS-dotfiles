{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.zsh;
    users.koenstevens = {
      isNormalUser = true;
      extraGroups = ["wheel" "libvirtd"];
    };
  };
}
