{pkgs, ...}:
pkgs.writeShellScriptBin "Flatseal" ''
  flatpak run com.github.tchx84.Flatseal
''
