{username, ...}: {
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = username;
          email = "gitlab.slurp563@passmail.net";
        };
        init.defaultBranch = "main";
      };
    };
  };
}
