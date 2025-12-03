{username, ...}: {
  programs.nh = {
    enable = true;
    flake = "/home/${username}/.dotfiles/";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 7d";
    };
  };
}
