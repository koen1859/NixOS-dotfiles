{pkgs, ...}: {
  home.packages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        ipython
        jupytext
        pandas
        numpy
      ]))
    (rWrapper.override {
      packages = with rPackages; [
        languageserver
        languageserversetup
        ChainLadder
      ];
    })
    zed-editor
    nixd
    devenv # Make nice dev shells
    direnv # Activate shells on directory level
  ];
}
