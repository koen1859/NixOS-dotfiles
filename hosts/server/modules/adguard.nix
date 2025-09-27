{
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    tls = {
      enabled = true;
      server_name = "dns.koenstevens.nl";
      port_https = 853;
      certificate_path = "/var/lib/acme/dns.koenstevens.nl/fullchain.pem";
      private_key_path = "/var/lib/acme/dns.koenstevens.nl/key.pem";
    };
    doh = {
      enabled = true;
      bind_port = 3001;
    };
  };
  networking.firewall.allowedTCPPorts = [53 853];
  networking.firewall.allowedUDPPorts = [53 853];

  services.nginx.virtualHosts."dns.koenstevens.nl" = {
    forceSSL = true;
    enableACME = true;
    proxyPass = "http://127.0.0.1:3001/dns-query";
  };
}
