{username, ...}: {
  sops.age.keyFile = "/home/${username}/.keys.txt";
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.secrets."ssh_private_key" = {};
  sops.secrets."home_ip" = {};
}
