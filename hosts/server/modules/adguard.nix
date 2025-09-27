# {
#   services.adguardhome = {
#     enable = true;
#     openFirewall = true;
#     tls = {
#       enabled = true;
#       server_name = "dns.koenstevens.nl";
#       port_https = 853;
#       certificate_path = "/var/lib/acme/dns.koenstevens.nl/fullchain.pem";
#       private_key_path = "/var/lib/acme/dns.koenstevens.nl/key.pem";
#     };
#     doh = {
#       enabled = true;
#       bind_port = 3001;
#     };
#   };
#   networking.firewall.allowedTCPPorts = [53 853];
#   networking.firewall.allowedUDPPorts = [53 853];
#
#   services.nginx.virtualHosts."dns.koenstevens.nl" = {
#     forceSSL = true;
#     enableACME = true;
#     proxyPass = "http://127.0.0.1:3001/dns-query";
#   };
# }
{
  services.adguardhome = {
    enable = true;
    openFirewall = true;

    mutableSettings = true;

    settings = {
      http = {
        address = "127.0.0.1:3000";
      };

      dns = {
        bind_hosts = ["0.0.0.0"];
        port = 53;
      };

      tls = {
        enabled = true;
        server_name = "dns.koenstevens.nl";
        force_https = false;
        port_https = 853;
        certificate_path = "/var/lib/acme/dns.koenstevens.nl/fullchain.pem";
        private_key_path = "/var/lib/acme/dns.koenstevens.nl/key.pem";

        allow_unencrypted_doh = true;
        strict_sni_check = false;
      };

      trusted_proxies = ["127.0.0.1"];
    };
  };

  networking.firewall.allowedTCPPorts = [53 853];
  networking.firewall.allowedUDPPorts = [53 853];

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts."dns.koenstevens.nl" = {
      forceSSL = true;
      enableACME = true;

      locations."/dns-query" = {
        proxyPass = "http://127.0.0.1:3000/dns-query";
        proxySetHeader = {
          Host = "dns.koenstevens.nl";
          X-Real-IP = "$remote_addr";
          X-Forwarded-For = "$proxy_add_x_forwarded_for";
        };
      };

      locations."/adguard/" = {
        proxyPass = "http://127.0.0.1:3000/";
        proxySetHeader = {
          Host = "dns.koenstevens.nl";
        };
      };
    };
  };
}
