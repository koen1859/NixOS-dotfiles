{pkgs, ...}:
pkgs.writeShellScriptBin "ProtonPass" ''
  flatpak run me.proton.Pass
''
