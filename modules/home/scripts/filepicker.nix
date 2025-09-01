{pkgs, ...}:
pkgs.writeShellScriptBin "filepicker" ''
  file_list = $(find "$HOME/Documents/Books" -maxdepth 2 -type f)
  choice = $(printf '%s\n' "$file_list" | ${pkgs.rofi}/bin/rofi -dmenu -i -p "Open book":)
  if [[ -n $choice ]]; then
  ${pkgs.zathura}/bin/zathura "$choice"
  fi
''
