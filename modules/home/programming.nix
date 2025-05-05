{pkgs, ...}: {
  home.packages = with pkgs; [
    python3
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
