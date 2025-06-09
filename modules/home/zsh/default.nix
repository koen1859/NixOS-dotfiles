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
    ];

    initContent = ''
      eval "$(direnv hook zsh)"
    '';

    shellAliases = {
      v = "nvim";
      c = "clear";
      cat = "${pkgs.bat}/bin/bat";
      ls = "${pkgs.lsd}/bin/lsd --color=auto";
      ll = "${pkgs.lsd}/bin/lsd -l --color=auto";
      grep = "grep --color=auto";
      ".." = "cd ..";
      gps = "git push github main";
      gpl = "git pull github main";
      ga = "git add --patch";
      gc = "git commit";
      gs = "git status";
      gd = "git diff";
    };
  };
}
