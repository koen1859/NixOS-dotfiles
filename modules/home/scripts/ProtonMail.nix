{pkgs, ...}:
pkgs.writeShellScriptBin "ProtonMail" ''
  flatpak run me.proton.Mail
''
