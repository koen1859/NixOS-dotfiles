{pkgs, ...}: {
  home.packages = with pkgs; [
    (python313.withPackages (ps:
      with ps; [
        ipython
        jupytext
      ]))
    (rWrapper.override {
      packages = with rPackages; [
        languageserver
        languageserversetup
      ];
    })
    devenv # Make nice dev shells
    direnv # Activate shells on directory level
  ];
}
