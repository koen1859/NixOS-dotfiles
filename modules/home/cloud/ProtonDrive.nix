{pkgs, ...}:
pkgs.writeShellScriptBin "ProtonDrive" ''
  ${pkgs.rclone}/bin/rclone --vfs-cache-mode writes mount Proton: ~/ProtonDrive &
  ${pkgs.libnotify}/bin/notify-send "ProtonDrive mounted"
''
