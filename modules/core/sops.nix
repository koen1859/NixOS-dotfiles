{username, ...}: {
  sops.age.keyFile = "/var/lib/sops-nix/keys.txt";
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.secrets."searx" = {};
  sops.secrets."ssh_public_key" = {
    owner = username;
  };
}
