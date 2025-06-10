{pkgs, ...}: {
  home.packages = with pkgs; [
    (python313.withPackages (ps:
      with ps; [
        ipython
      ]))
    (rWrapper.override {
      packages = with rPackages; [
      ];
    })
    devenv # Make nice dev shells
    direnv # Activate shells on directory level
  ];
}
