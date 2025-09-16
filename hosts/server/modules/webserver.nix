{username, ...}: {
  services.nginx = {
    enable = true;

    virtualHosts."koenstevens.nl" = {
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
      website = {
        description = "website service";
        after = ["network.target"];
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          ExecStart = "/home/${username}/website/start.sh";
          WorkingDirectory = "/home/${username}/website";
          Restart = "always";
          RestartSec = 5;
          Type = "simple";
          User = "${username}";
        };
      };
      website-restart = {
        description = "Reload website";
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "/run/current-system/sw/bin/systemctl restart website.service";
        };
      };
      scraper = {
        description = "Football scraper service";
        serviceConfig = {
          ExecStart = "/home/${username}/website/scraper.sh";
          WorkingDirectory = "/home/${username}/website";
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
      website-restart = {
        description = "reload website nightly at 04:10";
        wantedBy = ["timers.target"];
        timerConfig = {
          OnCalendar = "*-*-* 07:00:00";
          Persistent = true;
        };
      };
    };
  };
}
