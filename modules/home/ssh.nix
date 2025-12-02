{
  config,
  username,
  ...
}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "nixpc" = {
        hostname = builtins.readFile config.sops.secrets.home_ip.path;
        user = username;
        identityFile = "${config.sops.secrets.ssh_private_key.path}";
        port = 21;
      };
      "homeserver" = {
        hostname = builtins.readFile config.sops.secrets.home_ip.path;
        user = username;
        identityFile = "${config.sops.secrets.ssh_private_key.path}";
      };
      "rpi5" = {
        hostname = builtins.readFile config.sops.secrets.home_ip.path;
        user = username;
        identityFile = "${config.sops.secrets.ssh_private_key.path}";
        port = 2222;
      };
      "homegitserver" = {
        hostname = builtins.readFile config.sops.secrets.home_ip.path;
        user = "git";
        identityFile = "${config.sops.secrets.ssh_private_key.path}";
      };
      "github.com" = {
        user = "git";
        identityFile = "${config.sops.secrets.ssh_private_key.path}";
      };
      "gitlab.com" = {
        user = "git";
        identityFile = "${config.sops.secrets.ssh_private_key.path}";
      };
    };
  };
}
