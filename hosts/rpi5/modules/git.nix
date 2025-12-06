{
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
    };
  };
  users.users.git = {
    isNormalUser = true;
  };
}
