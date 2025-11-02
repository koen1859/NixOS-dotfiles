{
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.age.keyFile = "/var/lib/sops-nix/keys.txt";
  sops.secrets."searx" = {};
  sops.secrets."main_domain" = {};
  sops.secrets."search_domain" = {};
  sops.secrets."routing_domain" = {};
  sops.secrets."ssh_public_key" = {};
  sops.secrets."ssh_private_key" = {
    owner = "koenstevens";
    mode = "0600";
  };
}
