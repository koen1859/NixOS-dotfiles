{ config, pkgs, ... }:

{

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      ll = "ls -l --color=auto";
      ff = "fastfetch";
      ".." = "cd ..";
      v = "nvim";
    };

    initExtra = ''
      PS1='[\u@\h \W]\$ '
      source ~/.local/share/blesh/ble.sh
    '';
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
  };

}
