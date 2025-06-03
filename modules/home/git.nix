{
  programs = {
    git = {
      enable = true;
      userName = "koen1859";
      userEmail = "koenstevens1859@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
      lfs.enable = true;
      delta.enable = true;
    };
    lazygit.enable = true;
  };
}
