{pkgs, ...}: let
  rPackages = with pkgs.rPackages; [
    readxl
    rmarkdown
    stringi
    stringr
    survival
    xtable
    ggplot2
    quarto
    dplyr
    tidyverse
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
    quarto
  ];
  home.sessionVariables = {
    "QUARTO_R" = "${pkgs.which}/bin/which R";
  };
}
