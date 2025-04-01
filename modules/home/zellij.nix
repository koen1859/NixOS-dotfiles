{config, ...}: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = false;
  };

  xdg.configFile."zellij/config.kdl".text = with config.lib.stylix.colors; ''
    show_startup_tips false
    show_update_notes false
    copy-command "wl-copy"
    copy_on_select true
    simplified_ui false
    pane_frames false
    on_force_close "quit"
    default_layout "default"
    ui {
      pane_frames {
        rounded_corners false
      }
    }
    keybinds {
      normal {
        unbind "Ctrl q" "Ctrl b"
        bind "Enter" {
          WriteChars "\u{000D}";
          MessagePlugin "autolock" {};
        }
      }
      locked {
        bind "Alt z" {
          MessagePlugin "autolock" {payload "disable";};
          SwitchToMode "Normal";
        }
      }
      shared {
        bind "Alt Shift z" {
          MessagePlugin "autolock" {payload "enable";};
        }
        bind "Alt 1" { GoToTab 1; }
        bind "Alt 2" { GoToTab 2; }
        bind "Alt 3" { GoToTab 3; }
        bind "Alt 4" { GoToTab 4; }
        bind "Alt 5" { GoToTab 5; }
        bind "Alt 6" { GoToTab 6; }
        bind "Alt 7" { GoToTab 7; }
        bind "Alt 8" { GoToTab 8; }
        bind "Alt 9" { GoToTab 9; }

      }
      shared_except "locked" {
        bind "Alt z" {
          MessagePlugin "autolock" {payload "disable";};
          SwitchToMode "Locked";
        }
        bind "Ctrl h" { MoveFocusOrTab "Left"; }
        bind "Ctrl l" { MoveFocusOrTab "Right"; }
        bind "Ctrl j" { MoveFocusOrTab "Down"; }
        bind "Ctrl k" { MoveFocusOrTab "Up"; }

        bind "Alt p" { NewPane; }
        bind "Alt t" { NewTab; }
        bind "Alt q" { CloseFocus; }
        bind "Alt c" { Clear; }
        bind "Alt d" { Detach; }
      }
    }
    plugins {
      zjstatus location="https://github.com/dj95/zjstatus/releases/download/v0.20.1/zjstatus.wasm" {
        format_left   "{mode}#[bg=${base01}] {tabs}"
        format_center ""
        format_right  "#[bg=#${base0D},fg=#${base01},bold]  #[bg=#${base01},fg=#${base0D},bold] {session} #[bg=#${base01},fg=#${base0D},bold] {datetime}"
        format_space  ""
        format_hide_on_overlength "true"
        format_precedence "crl"

        border_enabled  "false"
        border_char     "─"
        border_format   "#[fg=#6C7086]{char}"
        border_position "top"

        mode_normal        "#[bg=#${base0B},fg=#${base01},bold] NORMAL#[bg=#${base01},fg=#${base0B}]█"
        mode_locked        "#[bg=#6e738d,fg=#${base01},bold] LOCKED #[bg=#${base01},fg=#6e738d]█"
        mode_resize        "#[bg=#f38ba8,fg=#${base01},bold] RESIZE#[bg=#${base01},fg=#f38ba8]█"
        mode_pane          "#[bg=#${base0E},fg=#${base01},bold] PANE#[bg=#${base01},fg=#${base0E}]█"
        mode_tab           "#[bg=#${base0D},fg=#${base01},bold] TAB#[bg=#${base01},fg=#${base0D}]█"
        mode_scroll        "#[bg=#f9e2af,fg=#${base01},bold] SCROLL#[bg=#${base01},fg=#f9e2af]█"
        mode_enter_search  "#[bg=#8aadf4,fg=#${base01},bold] ENT-SEARCH#[bg=#${base01},fg=#8aadf4]█"
        mode_search        "#[bg=#8aadf4,fg=#${base01},bold] SEARCHARCH#[bg=#${base01},fg=#8aadf4]█"
        mode_rename_tab    "#[bg=#b4befe,fg=#${base01},bold] RENAME-TAB#[bg=#${base01},fg=#b4befe]█"
        mode_rename_pane   "#[bg=#89b4fa,fg=#${base01},bold] RENAME-PANE#[bg=#${base01},fg=#89b4fa]█"
        mode_session       "#[bg=#${base0C},fg=#${base01},bold] SESSION#[bg=#${base01},fg=#${base0C}]█"
        mode_move          "#[bg=#f5c2e7,fg=#${base01},bold] MOVE#[bg=#${base01},fg=#f5c2e7]█"
        mode_prompt        "#[bg=#8aadf4,fg=#${base01},bold] PROMPT#[bg=#${base01},fg=#8aadf4]█"
        mode_tmux          "#[bg=#f5a97f,fg=#${base01},bold] TMUX#[bg=#${base01},fg=#f5a97f]█"

        // formatting for inactive tabs
        tab_normal              "#[bg=#${base01},fg=#${base0E}]█#[bg=#${base0E},fg=#${base01},bold]{index} #[bg=#${base00},fg=#${base0E},bold] {name}{floating_indicator}#[bg=#${base00},fg=#${base00},bold]█"
        tab_normal_fullscreen   "#[bg=#${base01},fg=#${base0E}]█#[bg=#${base0E},fg=#${base01},bold]{index} #[bg=#${base00},fg=#${base0E},bold] {name}{fullscreen_indicator}#[bg=#${base00},fg=#${base00},bold]█"
        tab_normal_sync         "#[bg=#${base01},fg=#${base0E}]█#[bg=#${base0E},fg=#${base01},bold]{index} #[bg=#${base00},fg=#${base0E},bold] {name}{sync_indicator}#[bg=#${base00},fg=#${base00},bold]█"

        // formatting for the current active tab
        tab_active              "#[bg=#${base08},fg=#${base08}]█#[bg=#${base08},fg=#${base01},bold]{index} #[bg=#${base01},fg=#${base08},bold] {name}{floating_indicator}#[bg=#${base00},fg=#${base01},bold]█"
        tab_active_fullscreen   "#[bg=#${base08},fg=#${base08}]█#[bg=#${base08},fg=#${base01},bold]{index} #[bg=#${base01},fg=#${base08},bold] {name}{fullscreen_indicator}#[bg=#${base00},fg=#${base01},bold]█"
        tab_active_sync         "#[bg=#${base08},fg=#${base08}]█#[bg=#${base08},fg=#${base01},bold]{index} #[bg=#${base01},fg=#${base08},bold] {name}{sync_indicator}#[bg=#${base00},fg=#${base01},bold]█"

        // separator between the tabs
        tab_separator           "#[bg=#${base00}] "

        // indicators
        tab_sync_indicator       " "
        tab_fullscreen_indicator " 󰊓"
        tab_floating_indicator   " 󰹙"

        command_git_branch_command     "git rev-parse --abbrev-ref HEAD"
        command_git_branch_format      "#[fg=blue] {stdout} "
        command_git_branch_interval    "10"
        command_git_branch_rendermode  "static"

        datetime        "#[fg=#6C7086,bold] {format} "
        datetime_format "%A, %d %b %Y %H:%M"
        datetime_timezone "Europe/Amsterdam"
      }
      autolock location="https://github.com/fresh2dev/zellij-autolock/releases/download/0.2.2/zellij-autolock.wasm" {
        is_enabled true
        triggers "nvim|vim|git|fzf|zoxide|atuin"
        reaction_seconds "0.3"
        print_to_log false
      }
    }
    load_plugins {
      autolock
    }
  '';
  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
      default_tab_template {
          children
          pane size=1 borderless=true {
              plugin location="zjstatus"
          }
      }
    }
  '';
}
