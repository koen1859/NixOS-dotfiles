{ ... }: {
  imports = [
    ./modules/home/hypr/hyprland.nix
    ./modules/home/hypr/animations.nix
    ./modules/home/hypr/keybindings.nix
    ./modules/home/hypr/windowrules.nix
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
    # Other programs
    ./modules/home/btop.nix
    ./modules/home/fastfetch.nix
    ./modules/home/git.nix
    ./modules/home/gtk.nix
    ./modules/home/htop.nix
    ./modules/home/kitty.nix
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
  ];

  home = {
    username = "koenstevens";
    homeDirectory = "/home/koenstevens";

    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
