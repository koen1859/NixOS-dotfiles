{pkgs, ...}: {
  home.packages = with pkgs; [
    osrm-backend
    (python313.withPackages (ps:
      with ps; [
        ipython
      ]))
    (rWrapper.override {
      packages = with rPackages; [
      ];
    })
    direnv
  ];
}
