{
  programs.nh = {
    enable = true;
    flake = "/home/koenstevens/.dotfiles/";
    clean = {
      enable = true;
      dates = "weekly";
    };
  };
}
