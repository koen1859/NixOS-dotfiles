{
  lib,
  pkgs,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    userSettings = {
      features = {
        copilot = false;
      };
      telemetry = {
        metrics = false;
      };
      vim_mode = true;
      languages = {
        python = {
          format_on_save = true;
          formatter = {
            external = {
              command = "${(lib.getExe pkgs.ruff)} format";
            };
          };
        };
      };
    };
    extensions = [
      "r"
      "nix"
      "python-snippets"
      "csv"
      "latex"
      "lua"
    ];
  };
}
