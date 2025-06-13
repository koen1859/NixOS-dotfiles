{pkgs, ...}: let
  ble-sh = pkgs.stdenv.mkDerivation rec {
    pname = "ble.sh";
    version = "nightly-2024-06";

    src = pkgs.fetchurl {
      url = "https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz";
      sha256 = "13qls3c1gy0jsjqpg4ja8y5im7mj5wk03p4cpq9x3lv713aa6im7";
    };
    nativeBuildInputs = [pkgs.xz];

    unpackPhase = ''
      mkdir source
      tar -xJf ${src} -C source --strip-components=1
    '';

    installPhase = ''
      mkdir -p $out/share/blesh
      cp -r . $out/share/blesh
    '';

    meta = {
      description = "Bash Line Editor (ble.sh) - nightly release";
      homepage = "https://github.com/akinomyoga/ble.sh";
      license = pkgs.lib.licenses.mit;
    };
  };
in {
  home.packages = [ble-sh];
  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  programs = {
    bash = {
      shellAliases = {
        ls = "${pkgs.lsd}/bin/lsd --color=auto";
        grep = "grep --color=auto";
        ll = "lsd -l --color=auto";
        ".." = "cd ..";
        v = "nvim";
        gps = "git push";
        gpl = "git pull";
        ga = "git add -A";
        gc = "git commit";
      };
      initExtra = ''
        source ${ble-sh}/share/blesh/source/ble.sh
      '';
    };
  };
}
