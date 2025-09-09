{username, ...}: {
  programs = {
    virt-manager.enable = true;
    dconf.enable = true;
  };
  users.groups.libvirtd.members = [username];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
  };
}
