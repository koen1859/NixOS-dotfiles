{pkgs, ...}: {
  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  programs = {
    bash = {
      enable = false;
      shellAliases = {
        ls = "${pkgs.lsd}/bin/lsd --color=auto";
        grep = "grep --color=auto";
        ll = "lsd -l --color=auto";
        ".." = "cd ..";
        v = "nvim";
        gps = "git push";
        gpl = "git pull";
        ga = "git add -A";
        gc = "git commit";
      };
    };

    starship = {
      enableBashIntegration = true;
      enable = true;
    };

    atuin = {
      enableBashIntegration = true;
      enable = true;
    };

    blesh.enable = true;
  };
}
