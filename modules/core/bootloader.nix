{
  pkgs,
  inputs,
  ...
}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = false;
        configurationLimit = 5;
        consoleMode = "max";
      };
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = false;
        theme = inputs.nixos-grub-themes.packages.${pkgs.system}.hyperfluent;
      };
      timeout = 30;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = ["quit" "splash"];
  };
}
