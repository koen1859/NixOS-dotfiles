{
  lib,
  config,
  ...
}: {
  programs.starship = {
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      format = lib.concatStrings [
        "\n"
        "[](fg:#${config.lib.stylix.colors.base0D})"
        "$os"
        "[](bg:#${config.lib.stylix.colors.base0D} fg:#${config.lib.stylix.colors.base08})"
        "$username"
        "[](bg:#${config.lib.stylix.colors.base08} fg:#${config.lib.stylix.colors.base0B})"
        "$directory"
        "[ ](fg:#${config.lib.stylix.colors.base0B})"
        "$git_branch"
        "$git_status"
        "$all"
        "$character"
      ];

      username = {
        show_always = true;
        format = "[$user ](bg:#${config.lib.stylix.colors.base08} fg:#${config.lib.stylix.colors.base00})";
        disabled = false;
      };

      os = {
        disabled = false;
        style = "bg:#${config.lib.stylix.colors.base0D} fg:#${config.lib.stylix.colors.base00}";
        symbols = {
          Alpaquita = " ";
          Alpine = " ";
          AlmaLinux = " ";
          Amazon = " ";
          Android = " ";
          Arch = " ";
          Artix = " ";
          CachyOS = " ";
          CentOS = " ";
          Debian = " ";
          DragonFly = " ";
          Emscripten = " ";
          EndeavourOS = " ";
          Fedora = " ";
          FreeBSD = " ";
          Garuda = "󰛓 ";
          Gentoo = " ";
          HardenedBSD = "󰞌 ";
          Illumos = "󰈸 ";
          Kali = " ";
          Linux = " ";
          Mabox = " ";
          Macos = " ";
          Manjaro = " ";
          Mariner = " ";
          MidnightBSD = " ";
          Mint = " ";
          NetBSD = " ";
          NixOS = " ";
          Nobara = " ";
          OpenBSD = "󰈺 ";
          openSUSE = " ";
          OracleLinux = "󰌷 ";
          Pop = " ";
          Raspbian = " ";
          Redhat = " ";
          RedHatEnterprise = " ";
          RockyLinux = " ";
          Redox = "󰀘 ";
          Solus = "󰠳 ";
          SUSE = " ";
          Ubuntu = " ";
          Unknown = " ";
          Void = " ";
          Windows = "󰍲 ";
        };
      };

      cmd_duration = {
        format = "[$duration](fg:#${config.lib.stylix.colors.base08})";
      };

      directory = {
        format = "[$path](bg:#${config.lib.stylix.colors.base0B} fg:#${config.lib.stylix.colors.base00})";
        truncation_length = 2;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Scripts" = "󰲋 ";
        };
      };

      character = {
        success_symbol = "[](bold #${config.lib.stylix.colors.base0D})";
        error_symbol = "[✗](bold #${config.lib.stylix.colors.base08})";
        disabled = false;
      };

      git_branch = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      git_commit = {
        tag_symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      aws = {
        symbol = "   ";
        format = "[$symbol($version)]($style)";
      };

      buf = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      c = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      cmake = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      conda = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      crystal = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      dart = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      docker_context = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      elixir = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      elm = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      fennel = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      golang = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      guix_shell = {
        symbol = "   ";
        format = "[$symbol($version)]($style)";
      };

      haskell = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      haxe = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      hg_branch = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      hostname = {
        ssh_symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      java = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      julia = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      kotlin = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      lua = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      memory_usage = {
        symbol = " 󰍛 ";
        format = "[$symbol($version)]($style)";
      };

      meson = {
        symbol = " 󰔷 ";
        format = "[$symbol($version)]($style)";
      };

      nim = {
        symbol = " 󰆥 ";
        format = "[$symbol($version)]($style)";
      };

      nix_shell = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      nodejs = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      ocaml = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      package = {
        symbol = " 󰏗 ";
        format = "[$symbol($version)]($style)";
      };

      perl = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      php = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      pijul_channel = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      python = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      rlang = {
        symbol = " 󰟔 ";
        format = "[$symbol($version)]($style)";
      };

      ruby = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      rust = {
        symbol = " 󱘗 ";
        format = "[$symbol($version)]($style)";
      };

      scala = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      swift = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      zig = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };

      gradle = {
        symbol = "  ";
        format = "[$symbol($version)]($style)";
      };
    };
  };
}
