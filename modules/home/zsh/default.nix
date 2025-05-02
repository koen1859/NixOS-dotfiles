{
  profile,
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
      sv = "sudo nvim";
      v = "nvim";
      c = "clear";
      cat = "bat";
      man = "batman";
      ls = "lsd --color=auto";
      grep = "grep --color=auto";
      ll = "lsd -l --color=auto";
      ff = "fastfetch";
      mf = "microfetch";
      ".." = "cd ..";
      gps = "git push";
      gpl = "git pull";
      ga = "git add";
      gc = "git commit";
      gs = "git status";
      gd = "git diff";
    };
  };
}
