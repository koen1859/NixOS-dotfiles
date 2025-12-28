{username, ...}: {
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  programs = {
    virt-manager.enable = true;
    dconf.enable = true;
  };
  users.groups.libvirtd.members = [username];

  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
      };
    };
  };
}
