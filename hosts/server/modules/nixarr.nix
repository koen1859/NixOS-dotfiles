{
  nixarr = {
    enable = true;
    mediaDir = "/data/media";
    stateDir = "/data/media/.state/nixarr";

    vpn = {
      enable = true;
      wgConf = "/data/.secret/wg-CH-414.conf";
    };

    jellyfin = {
      enable = true;
    };

    transmission = {
      enable = true;
      vpn.enable = true;
      peerPort = 52158;
      extraSettings = {
        "peer-port-random-on-start" = true; # Avoid fixed blocked port
        "pex-enabled" = true;
        "dht-enabled" = true;
        "lpd-enabled" = false;
      };
    };
  };
}
