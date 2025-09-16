{
  shell,
  username,
  ...
}: {
  users = {
    defaultUserShell = shell;
    users = {
      ${username} = {
        isNormalUser = true;
        extraGroups = ["wheel"];
      };
    };
  };
}
