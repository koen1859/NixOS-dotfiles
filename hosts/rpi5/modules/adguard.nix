{
  services.adguardhome = {
    enable = true;
    openFirewall = true;
  };
  networking.firewall.allowedTCPPorts = [53];
  networking.firewall.allowedUDPPorts = [53];
  services.nginx = {
    enable = true;
    virtualHosts."dns.koenstevens.nl" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:3000";
      };
    };
  };
}
