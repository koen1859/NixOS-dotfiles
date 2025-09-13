{username, ...}: {
  services.nginx = {
    enable = true;

    virtualHosts."football.koenstevens.nl" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:5001";
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    email = "letsencrypt.isotope814@passmail.net";
  };

  networking.firewall.allowedTCPPorts = [80 443];

  systemd = {
    services = {
      football = {
        description = "Football app service";
        after = ["network.target"];
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          ExecStart = "/home/${username}/Documents/Football/start.sh";
          WorkingDirectory = "/home/${username}/Documents/Football";
          Restart = "always";
          RestartSec = 5;
          Type = "simple";
          User = "${username}";
        };
      };
      scraper = {
        description = "Football scraper service";
        serviceConfig = {
          ExecStart = "/home/${username}/Documents/Football/scraper.sh";
          WorkingDirectory = "/home/${username}/Documents/Football";
          User = "${username}";
          Type = "oneshot";
          TimeoutStartSec = "infinity";
        };
      };
    };
    timers = {
      scraper = {
        description = "Run scraper every night at 4am";
        wantedBy = ["timers.target"];
        timerConfig = {
          OnCalendar = "*-*-* 04:00:00";
          Persistent = true;
        };
      };
    };
  };
}
