{
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = " ➜  ";
      };

      modules = [
        "break"
        {
          type = "os";
          key = " ┌  ";
          keyColor = "31";
        }
        {
          type = "kernel";
          key = " ├  ";
          keyColor = "31";
        }
        {
          type = "packages";
          key = " ├ 󰏖 ";
          keyColor = "31";
        }
        {
          type = "shell";
          key = " └  ";
          keyColor = "31";
        }
        "break"
        {
          type = "wm";
          key = " ┌  ";
          keyColor = "32";
        }
        {
          type = "wmtheme";
          key = " ├ 󰉼 ";
          keyColor = "32";
        }
        {
          type = "icons";
          key = " ├ 󰀻 ";
          keyColor = "32";
        }
        {
          type = "cursor";
          key = " ├ 󰇀 ";
          keyColor = "32";
        }
        {
          type = "terminal";
          key = " ├  ";
          keyColor = "32";
        }
        {
          type = "terminalfont";
          key = " └  ";
          keyColor = "32";
        }
        "break"
        {
          type = "host";
          format = "{5} {1} Type {2}";
          key = " ┌ 󰇅 ";
          keyColor = "33";
        }
        {
          type = "cpu";
          format = "{1} ({3}) @ {7}";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "gpu";
          format = "{1} {2} @ {12}";
          key = " ├ 󰢮 ";
          keyColor = "33";
        }
        {
          type = "memory";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "swap";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "disk";
          key = " ├ 󰋊 ";
          keyColor = "33";
        }
        {
          type = "monitor";
          key = " └  ";
          keyColor = "33";
        }
        "break"
        {
          type = "uptime";
          key = " ┌ 󱎫 ";
        }
        {
          type = "command";
          key = " └ 󰔟 ";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
      ];
    };
  };
}
