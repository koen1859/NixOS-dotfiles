{pkgs, ...}:
pkgs.writeShellScriptBin "weather" ''
  curl wttr.in
''
