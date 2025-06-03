{
  programs.nh = {
    enable = true;
    flake = "~/.dotfiles/";
    clean = {
      enable = true;
      dates = "weekly";
    };
  };
}
