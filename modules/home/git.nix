{username, ...}: {
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = username;
          email = "gitlab.slurp563@passmail.net";
        };
        extraConfig = {
          init.defaultBranch = "main";
        };
      };
    };
    lazygit.enable = true;
  };
}
