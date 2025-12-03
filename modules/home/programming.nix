{pkgs, ...}: let
  rPackages = with pkgs.rPackages; [
    readxl
    rmarkdown
    stringi
    stringr
    survival
    xtable
    ggplot2
  ];
in {
  home.packages = with pkgs; [
    (python313.withPackages (ps:
      with ps; [
        ipython
      ]))
    (rWrapper.override {
      packages = rPackages;
    })
    (pkgs.rstudioWrapper.override {
      packages = rPackages;
    })
    direnv
  ];
}
