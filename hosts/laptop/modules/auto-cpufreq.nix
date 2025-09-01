{
  services.power-profiles-daemon.enable = true;
  programs.auto-cpufreq = {
    enable = false;
    settings = {
      charger = {
        governor = "performance";
        turbo = "auto";
      };
      battery = {
        governor = "powersave";
        turbo = "never";
      };
    };
  };
}
