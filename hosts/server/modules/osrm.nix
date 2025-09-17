{
  pkgs,
  username,
  ...
}: let
  osrmData = "/home/username/osrm/netherlands-latest.osrm";
in {
  # services.nginx = {
  #   enable = true;
  #   virtualHosts = {
  #     "routing.koenstevens.nl" = {
  #       enableACME = true;
  #       forceSSL = true;
  #       locations."/" = {
  #         proxyPass = "http://127.0.0.1:5000";
  #       };
  #     };
  #   };
  # };
  systemd.services = {
    description = "OSRM Routing Backend";
    wantedBy = ["multi-user.targer"];
    serviceConfig = {
      ExecStart = "${pkgs.osrm-backend}/bin/osrm-routed --algorithm mld --port 5000 --host 0.0.0.0 ${osrmData}";
      WorkingDirectory = "/home/${username}/osrm";
      Restart = "on-failure";
    };
  };
}
