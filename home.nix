{...}: {
  imports = [
    ./modules/home/hypr/hyprland.nix
    ./modules/home/hypr/animations.nix
    ./modules/home/hypr/keybindings.nix
    ./modules/home/hypr/windowrules.nix
    ./modules/home/hypr/hyprlock.nix
    ./modules/home/wlogout/wlogout.nix
    # Nixvim modules
    ./modules/home/nixvim/nixvim.nix
    ./modules/home/nixvim/ui.nix
    ./modules/home/nixvim/telescope.nix
    ./modules/home/nixvim/formatting.nix
    ./modules/home/nixvim/syntax_hl.nix
    ./modules/home/nixvim/lsp.nix
    ./modules/home/nixvim/keymaps.nix
    ./modules/home/nixvim/luasnip.nix
    ./modules/home/nixvim/zellij-nav.nix
    ./modules/home/nixvim/vimtex.nix
    ./modules/home/nixvim/misc.nix
    ./modules/home/nixvim/cmp.nix
    ./modules/home/nixvim/git.nix
    ./modules/home/nixvim/neorg.nix
    ./modules/home/nixvim/orgmode.nix
    # Other programs
    ./modules/home/btop.nix
    ./modules/home/fastfetch.nix
    ./modules/home/git.nix
    ./modules/home/gtk.nix
    ./modules/home/htop.nix
    ./modules/home/kitty.nix
    ./modules/home/nixcord.nix
    # ./modules/home/nvf.nix
    ./modules/home/qt.nix
    ./modules/home/shell.nix
    ./modules/home/starship.nix
    ./modules/home/stylix.nix
    ./modules/home/swaync.nix
    ./modules/home/wofi.nix
    ./modules/home/waybar.nix
    ./modules/home/zathura.nix
    ./modules/home/zellij.nix
    ./modules/home/librewolf.nix
    ./modules/home/spicetify.nix
    ./modules/home/zen.nix
  ];

  home = {
    username = "koenstevens";
    homeDirectory = "/home/koenstevens";
    sessionVariables = {
      TEXMFHOME = "/home/koenstevens/.dotfiles/modules/home/nixvim/texmf";
    };
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
