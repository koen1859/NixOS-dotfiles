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
      ls = "${pkgs.eza}/bin/eza --icons";
      lt = "${pkgs.eza}/bin/eza --icons -TL 2";
      cd = "z";
      ff = "${pkgs.fzf}/bin/fzf";
      grep = "grep --color=auto";
      ".." = "z ..";
      gps = "${pkgs.git}/bin/git push gitserver main";
      gpl = "${pkgs.git}/bin/git pull gitserver main";
      ga = "${pkgs.git}/bin/git add --patch";
      gc = "${pkgs.git}/bin/git commit";
      gs = "${pkgs.git}/bin/git status";
      gd = "${pkgs.git}/bin/git diff";
    };
  };
}
