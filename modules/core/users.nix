{
  pkgs,
  username,
  ...
}: {
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      ${username} = {
        isNormalUser = true;
        extraGroups = ["wheel"];
      };
    };
  };
}
