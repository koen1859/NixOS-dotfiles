{pkgs, ...}: {
  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        ls = "lsd --color=auto";
        grep = "grep --color=auto";
        ll = "lsd -l --color=auto";
        ff = "fastfetch";
        mf = "microfetch";
        ".." = "cd ..";
        v = "nvim";
        gps = "git push";
        gpl = "git pull";
        ga = "git add -A";
        gc = "git commit";
        rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles";
        latex = "bash ~/.dotfiles/modules/home/latex.sh";
      };

      initExtra = ''
        source ~/.local/share/blesh/ble.sh
      '';
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
    };

    atuin = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
