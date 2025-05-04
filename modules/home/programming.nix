{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
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
