{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) username;
in {
  programs.virt-manager.enable = true;
  # IMPORTANT: change $user to your username
  users.groups.libvirtd.members = [username];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };
}
