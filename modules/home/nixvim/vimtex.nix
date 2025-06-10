{pkgs, ...}: {
  programs.nixvim.plugins = {
    vimtex = {
      enable = true;
      texlivePackage = pkgs.texliveFull.withPackages (ps:
        with ps; [
          latexmk
          amsmath
          marvosym
          bbm-macros
          minted
          texcount
          tocbibind
          latexindent
          adjustbox
          algpseudocodex
          algorithmicx
          algorithms
          fifo-stack
          varwidth
          tabto-ltx
          totcount
        ]);
    };
    ltex-extra.enable = true;
  };
}
