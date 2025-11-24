{
  pkgs,
  username,
  ...
}: let
  osrmData = "/home/${username}/osrm/netherlands-latest.osrm";
  osrm = pkgs.osrm-backend.overrideAttrs (old: {
    CXXFLAGS = (old.CXXFLAGS or []) ++ ["-Wno-error=maybe-uninitialized"];
  });
in {
  services.nginx = {
    enable = true;
    virtualHosts = {
      "routing.koenstevens.nl" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:5000";
        };
      };
    };
  };
  systemd.services.osrm = {
    description = "OSRM Routing Backend";
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${osrm}/bin/osrm-routed --max-table-size 1000000 --algorithm mld -p 5000 -i 0.0.0.0 ${osrmData}";
      WorkingDirectory = "/home/${username}/osrm";
      Restart = "on-failure";
    };
  };
  networking.firewall.allowedTCPPorts = [5000];
}
