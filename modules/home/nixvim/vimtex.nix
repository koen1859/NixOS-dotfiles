{pkgs, ...}: {
  programs.nixvim.plugins = {
    vimtex = {
      enable = true;
      texlivePackage = pkgs.texliveFull.withPackages (ps:
        with ps; [
          bbm
          latexmk
          amsmath
        ]);
    };
  };
}
