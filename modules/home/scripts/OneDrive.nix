{pkgs, ...}:
pkgs.writeShellScriptBin "OneDrive" ''
  ${pkgs.rclone}/bin/rclone --vfs-cache-mode writes mount OneDrive: ~/OneDrive/ &
  ${pkgs.libnotify}/bin/notify-send "OneDrive mounted"
''
