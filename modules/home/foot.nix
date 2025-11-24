{lib, ...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "Jetbrains Mono Nerd Font:size=15";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
