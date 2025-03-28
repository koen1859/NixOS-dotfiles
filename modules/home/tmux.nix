{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.cpu
    ];
    extraConfig = ''
      set -g default-terminal "screen-256color" # Set terminal type for 256-color support
      set -ga terminal-overrides ",*256col*:Tc" # Override to enable true-color for compatible terminals
      set -g set-clipboard on         # Use system clipboard
      set -g detach-on-destroy off    # Don't exit from tmux when closing a session
      set -g escape-time 0            # Remove delay for exiting insert mode with ESC in Neovim
      set -g history-limit 1000000    # Increase history size (from 2,000)
      set -g mouse on                 # Enable mouse support
      set -g status-interval 3        # Update the status bar every 3 seconds (default: 15 seconds)
      set -g allow-passthrough on   # Allow programs in the pane to bypass tmux (e.g. for image preview)
      unbind C-b              # Unbind the default prefix key
      set -g prefix C-Space   # Set new prefix key to Ctrl+C-Space
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf
      unbind %
      bind \\ split-window -h -c "#{pane_current_path}"
      unbind \"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5
      bind -r m resize-pane -Z
      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind -T copy-mode-vi 'y' send-keys -X copy-pipe-and-cancel "wl-copy"
       # Paste yanked text with "Prefix + P" ("Prefix + p" goes to previous window)
      bind P paste-buffer
      unbind -T copy-mode-vi MouseDragEnd1Pane
      set -g base-index 1
      set -g pane-base-index 1
      set -g renumber-windows on # Automatically renumber windows when one is closed
      set -g status-justify centre
      set -g pane-border-style "fg=brightblack,bg=default"
      set -g @resurrect-capture-pane-contents 'on'
      set -g @continuum-restore 'on'
    '';
  };
}
