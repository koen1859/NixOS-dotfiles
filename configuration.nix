{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.timeout = 30;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.shells = with pkgs; [ bash ];
  users.defaultUserShell = pkgs.bash;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import <nixos-unstable> { };
    };
    allowUnfree = true;
  };

  users.users.koenstevens = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    hyprland
    hyprshot
    waybar
    kitty
    swaynotificationcenter
    wofi
    wl-clipboard
    networkmanagerapplet
    firefox
    brave
    zathura
    fastfetch
    rclone
    pywal
    swww
    yazi
    starship
    git
    atuin
    pywalfox-native
    neovim
    texlive.combined.scheme-full
    nixd
    lua53Packages.sqlite
    sqlite
    lua
    lua54Packages.luarocks
    vimPlugins.sqlite-lua
    vimPlugins.telescope-fzf-native-nvim
    ripgrep
    fd
    vimPlugins.nvim-fzf
    nodejs_23
    python3
    python312Packages.ipython
    python312Packages.psycopg2
    python312Packages.igraph
    python312Packages.folium
    cargo
    rustc
    cmake
    gnumake
    unzip
    python312Packages.pip
    vimPlugins.jupytext-nvim
    python312Packages.jupytext
    nodejs_20.out
    fzf
    vimPlugins.fzfWrapper
    quarto
    vimPlugins.quarto-nvim
    imagemagick
    lua5_1
    luajit
    tree-sitter
    gcc
    wlogout
    hypridle
    hyprlock
    bitwarden-desktop
    brightnessctl
    R
    (rWrapper.override {
      packages = with rPackages; [
        languageserver
        languageserversetup
        lintr
        roxygen2
        xml2
        ggplot2
        MASS
      ];
    })
    vscode
    rstudio
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
    librewolf
    (pkgs.callPackage ./programs/lkh.nix { })
    ruff-lsp
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.code-new-roman
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
  ];

  programs.hyprland.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  environment.sessionVariables = {
    nixos_ozone_wl = "1";
  };

  system.stateVersion = "24.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_17;
    dataDir = "/var/lib/postgresql/data";
    extensions = with pkgs.postgresql17Packages; [ postgis ];
    authentication = ''
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            trust
      host    all             all             ::1/128                 trust
    '';
  };
}
