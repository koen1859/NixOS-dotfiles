{lib, ...}: {
  home.file.".texmf/tex/latex/custom/natbib.sty".source = ./natbib.sty;
  home.file.".texmf/tex/latex/custom/rug-econometrics.bst".source = ./rug-econometrics.bst;

  home.activation.texmfUpdate = lib.hm.dag.entryAfter ["writeBoundary"] ''
    echo "Refreshing texmf filename database..."
    mktexlsr "$HOME/.texmf"
  '';
}
