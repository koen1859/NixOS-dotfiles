{username, ...}: {
  programs = {
    git = {
      enable = true;
      userName = username;
      userEmail = "gitlab.slurp563@passmail.net";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    lazygit.enable = true;
  };
}
