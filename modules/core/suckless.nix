{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.st.overrideAttrs (_: {
      src = ./st;
      patches = [];
    }))
    (pkgs.dmenu.overrideAttrs (_: {
      src = ./dmenu;
      patches = [];
    }))
    (pkgs.slstatus.overrideAttrs (_: {
      src = ./slstatus;
      patches = [];
    }))
  ];
}
