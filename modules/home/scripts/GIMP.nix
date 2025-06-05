{pkgs, ...}:
pkgs.writeShellScriptBin "GIMP" ''
  flatpak run org.gimp.GIMP
''
