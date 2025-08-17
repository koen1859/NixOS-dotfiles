{pkgs, ...}: {
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        ls = "${pkgs.lsd}/bin/lsd --color=auto";
        grep = "grep --color=auto";
        ll = "${pkgs.lsd}/bin/lsd -l --color=auto";
        ".." = "cd ..";
        v = "nvim";
        gps = "git push";
        gpl = "git pull";
        ga = "git add -A";
        gc = "git commit";
      };
    };
  };
}
