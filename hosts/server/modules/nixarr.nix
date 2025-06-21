{
  nixarr = {
    enable = true;
    mediaDir = "/data/media";
    stateDir = "/data/media/.state/nixarr";

    vpn = {
      enable = true;
      wgConf = "/data/.secret/wg.conf";
    };

    jellyfin = {
      enable = true;
      expose.https = {
        enable = true;
        domainName = "media.koenstevens.nl";
        acmeMail = "koenstevens1859@pm.me";
      };
    };

    transmission = {
      enable = true;
      vpn.enable = true;
      peerPort = 52158;
      openFirewall = true;
      extraSettings = {
        "peer-port-random-on-start" = true; # Avoid fixed blocked port
        "upload-speed-limit" = 0;
        "upload-speed-limit-enabled" = true;
        "ratio-limit" = 0;
        "ratio-limit-enabled" = true;
        "pex-enabled" = false;
        "dht-enabled" = false;
        "lpd-enabled" = false;
        "utp-enabled" = false;
      };
    };
    radarr.enable = true;
    sonarr.enable = true;
    prowlarr.enable = true;
  };
}
