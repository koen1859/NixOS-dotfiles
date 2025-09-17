{
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

  security.acme = {
    acceptTerms = true;
    email = "letsencrypt.isotope814@passmail.net";
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
