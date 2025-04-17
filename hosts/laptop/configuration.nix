{pkgs, ...}: {
  imports = [
    ./hardware.nix
  ];
  networking.hostName = "nixlaptop";

  environment.systemPackages = with pkgs; [
    tlp
  ];

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 80;
    };
  };
  fileSystems."/home/koenstevens/secondary_storage" = {
    device = "/dev/nvme0n1p2";
    fsType = "ext4";
    options = ["defaults"];
  };
}
