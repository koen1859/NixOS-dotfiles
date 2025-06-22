{pkgs, ...}: {
  systemd.services.top-bar = {
    Unit = {
      Description = "Top Bar";
      After = ["graphical-session.target"];
      Wants = ["graphical-session.target"];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.top-bar}/bin/top-bar";
      Restart = "on-failure";
      RestartSec = 3;
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
