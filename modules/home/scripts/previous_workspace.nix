{pkgs, ...}:
pkgs.writeShellScriptBin "previous_workspace" ''
  used_workspaces=($(hyprctl workspaces -j | ${pkgs.jq}/bin/jq -r '.[].id' | sort -n))
  current=$(hyprctl activeworkspace -j | ${pkgs.jq}/bin/jq -r '.id')
  for i in "''${!used_workspaces[@]}"; do
      if [[ "''${used_workspaces[$i]}" == "$current" ]]; then
          current_index=$i
          break
      fi
  done
  prev_index=$(( (current_index - 1) % ''${#used_workspaces[@]} ))
  hyprctl dispatch workspace "''${used_workspaces[$prev_index]}"
''
