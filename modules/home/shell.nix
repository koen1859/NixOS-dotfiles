_: {
  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        ls = "ls --color=auto";
        grep = "grep --color=auto";
        ll = "ls -l --color=auto";
        ff = "fastfetch";
        ".." = "cd ..";
        v = "nvim";
      };

      initExtra = ''
        PS1='[\u@\h \W]\$ '
        source ~/.local/share/blesh/ble.sh
        if ! pgrep -f "cpu_ram_monitor.sh" > /dev/null; then
          bash ~/.dotfiles/Bash-Scripts/cpu_ram_monitor.sh &
        fi
      '';
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
    };

    atuin = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
