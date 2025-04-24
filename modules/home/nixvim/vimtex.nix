{pkgs, ...}: let
  natbibCustom = pkgs.stdenv.mkDerivation {
    pname = "rug-econometrics";
    version = "1.0";
    src = ./texmf;

    installPhase = ''
      mkdir -p $out/texmf
      cp -r tex $out/texmf/
      cp -r bibtex $out/texmf/
    '';
  };
in {
  programs.nixvim.plugins = {
    vimtex = {
      enable = true;
      texlivePackage = pkgs.texliveFull.withPackages (ps:
        with ps; [
          bbm
          latexmk
          amsmath
          natbibCustom
        ]);
    };
  };
}
