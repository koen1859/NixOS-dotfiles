{pkgs, ...}: {
  environment = {
    shells = with pkgs; [bash];
    sessionVariables = {
      nixos_ozone_wl = "1";
    };
    systemPackages = with pkgs; [
      vim
      wget
      hyprland
      xfce.thunar
      hyprshot
      waybar
      kitty
      swaynotificationcenter
      wl-clipboard
      networkmanagerapplet
      firefox
      brave
      zathura
      fastfetch
      rclone
      yazi
      starship
      git
      atuin
      neovim
      texlive.combined.scheme-full
      nixd
      sqlite
      lua
      ripgrep
      fd
      nodejs_23
      python3
      cargo
      rustc
      cmake
      gnumake
      unzip
      nodejs_20.out
      fzf
      quarto
      imagemagick
      lua5_1
      luajit
      tree-sitter
      gcc
      wlogout
      bitwarden-desktop
      brightnessctl
      R
      (rWrapper.override {
        packages = with rPackages; [
          languageserver
          languageserversetup
          lintr
        ];
      })
      blueman
      tmux
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      osmium-tool
      postgresql_17
      postgresql17Packages.postgis
      osm2pgsql
      bibata-cursors
      papirus-icon-theme
      openvpn
      nixpkgs-fmt
      (pkgs.callPackage ./lkh.nix {})
      ruff-lsp
      btop
      nix-ld
      glibc
      htop
      libnotify
      pavucontrol
      greetd.tuigreet
      spotify
      spicetify-cli
      obs-studio
      onefetch
      signal-desktop
      timg
      flatpak
      plocate
      vlc
      organicmaps
      speedtest-cli
      base16-schemes
      wofi
      yq
    ];
  };
}
