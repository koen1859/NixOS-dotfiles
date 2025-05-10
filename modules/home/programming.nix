{pkgs, ...}: {
  home.packages = with pkgs; [
    (python3.withPackages (ps:
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
    zed-editor
    nixd
    devenv # Make nice dev shells
    direnv # Activate shells on directory level
  ];
}
