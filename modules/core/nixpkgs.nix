_: {
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import <nixos-unstable> {};
    };
    allowUnfree = true;
  };
}
