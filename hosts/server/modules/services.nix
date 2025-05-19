{pkgs, ...}: {
  services = {
    jellyfin = {
      enable = true;
      package = pkgs.jellyfin;
      dataDir = "/data/media/";
      openFirewall = true;
    };
    transmission = {
      enable = true;
      package = pkgs.transmission_4;
      home = "/data/transmission/";
      settings = {
        bind-address-ipv4 = "10.2.0.2";
      };
    };
  };
  networking = {
    nameservers = ["10.2.0.1"];
    wireguard = {
      enable = true;
      interfaces = {
        wg0 = {
          ips = ["10.2.0.2/32"];
          privateKeyFile = "/data/.secret/private.key";
          peers = [
            {
              publicKey = "R8TfZYSkUM30soIPOVpNsP35qCnnJvJJI9r/VxH5TkQ=";
              AllowedIPs = ["0.0.0.0/0"];
              endpoint = "146.70.226.226:51820";
              persistentKeepalive = 25;
            }
          ];
        };
      };
    };
  };
  systemd.network.enable = true;
  systemd.services.wg0 = {
    wantedBy = ["multi-user.target"];
    after = ["network-online.target"];
  };
}
