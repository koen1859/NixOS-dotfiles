{
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
    ];

    initContent = ''
      eval "$(direnv hook zsh)"
    '';

    shellAliases = {
      v = "nvim";
      c = "clear";
      cat = "${pkgs.bat}/bin/bat";
      ls = "${pkgs.eza}/bin/eza";
      cd = "z";
      ff = "${pkgs.fzf}/bin/fzf";
      grep = "grep --color=auto";
      ".." = "cd ..";
      gps = "git push gitlab main";
      gpl = "git pull gitlab main";
      ga = "git add --patch";
      gc = "git commit";
      gs = "git status";
      gd = "git diff";
    };
  };
}
