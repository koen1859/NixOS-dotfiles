{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.mango = {
    enable = true;
    autostart_sh = ''
      noctalia-shell & disown
    '';
    settings = ''
      # Window effect
      blur=0
      blur_layer=0
      blur_optimized=1
      blur_params_num_passes = 2
      blur_params_radius = 5
      blur_params_noise = 0.02
      blur_params_brightness = 0.9
      blur_params_contrast = 0.9
      blur_params_saturation = 1.2

      shadows = 0
      layer_shadows = 0
      shadow_only_floating = 1
      shadows_size = 10
      shadows_blur = 15
      shadows_position_x = 0
      shadows_position_y = 0
      shadowscolor= 0x000000ff

      border_radius=6
      no_radius_when_single=0
      focused_opacity=1.0
      unfocused_opacity=1.0

      # Animation Configuration(support type:zoom,slide)
      # tag_animation_direction: 0-horizontal,1-vertical
      animations=1
      layer_animations=1
      animation_type_open=slide
      animation_type_close=slide
      animation_fade_in=1
      animation_fade_out=1
      tag_animation_direction=1
      zoom_initial_ratio=0.3
      zoom_end_ratio=0.8
      fadein_begin_opacity=0.5
      fadeout_begin_opacity=0.8
      animation_duration_move=500
      animation_duration_open=400
      animation_duration_tag=350
      animation_duration_close=800
      animation_duration_focus=0
      animation_curve_open=0.46,1.0,0.29,1
      animation_curve_move=0.46,1.0,0.29,1
      animation_curve_tag=0.46,1.0,0.29,1
      animation_curve_close=0.08,0.92,0,1
      animation_curve_focus=0.46,1.0,0.29,1

      # Scroller Layout Setting
      scroller_structs=20
      scroller_default_proportion=0.8
      scroller_focus_center=0
      scroller_prefer_center=0
      edge_scroller_pointer_focus=1
      scroller_default_proportion_single=1.0
      scroller_proportion_preset=0.5,0.8,1.0

      # Master-Stack Layout Setting
      new_is_master=1
      default_mfact=0.55
      default_nmaster=1
      smartgaps=0

      # Overview Setting
      hotarea_size=10
      enable_hotarea=1
      ov_tab_mode=0
      overviewgappi=5
      overviewgappo=30

      # Misc
      no_border_when_single=0
      axis_bind_apply_timeout=100
      focus_on_activate=1
      inhibit_regardless_of_visibility=0
      sloppyfocus=1
      warpcursor=1
      focus_cross_monitor=0
      focus_cross_tag=0
      enable_floating_snap=0
      snap_distance=30
      cursor_size=24
      drag_tile_to_tile=1

      # keyboard
      repeat_rate=35
      repeat_delay=300
      numlockon=0
      xkb_rules_layout=us
      xkb_rules_options=caps:swapescape

      # Trackpad
      # need relogin to make it apply
      disable_trackpad=0
      tap_to_click=1
      tap_and_drag=1
      drag_lock=1
      trackpad_natural_scrolling=0
      disable_while_typing=1
      left_handed=0
      middle_button_emulation=0
      swipe_min_threshold=1

      # mouse
      mouse_natural_scrolling=0

      # Appearance
      gappih=5
      gappiv=5
      gappoh=5
      gappov=5
      scratchpad_width_ratio=0.8
      scratchpad_height_ratio=0.9
      borderpx=2
      rootcolor=0x${builtins.substring 1 6 config.lib.stylix.colors.base00}ff
      # bordercolor=0x${builtins.substring 1 6 config.lib.stylix.colors.base02}ff
      focuscolor=0x${builtins.substring 1 6 config.lib.stylix.colors.base0D}ff
      maximizescreencolor=0x${builtins.substring 1 6 config.lib.stylix.colors.base0D}ff
      urgentcolor=0x${builtins.substring 1 6 config.lib.stylix.colors.base08}ff
      scratchpadcolor=${builtins.substring 1 6 config.lib.stylix.colors.base0B}ff
      globalcolor=0x${builtins.substring 1 6 config.lib.stylix.colors.base0B}ff
      overlaycolor=0x${builtins.substring 1 6 config.lib.stylix.colors.base0B}ff

      # layout support:
      # tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
      tagrule=id:1,layout_name:scroller
      tagrule=id:2,layout_name:scroller
      tagrule=id:3,layout_name:scroller
      tagrule=id:4,layout_name:scroller
      tagrule=id:5,layout_name:scroller
      tagrule=id:6,layout_name:scroller
      tagrule=id:7,layout_name:scroller
      tagrule=id:8,layout_name:scroller
      tagrule=id:9,layout_name:scroller

      # Key Bindings
      # key name refer to `xev` or `wev` command output,
      # mod keys name: super,ctrl,alt,shift,none

      # reload config
      bind=SUPER+SHIFT,r,reload_config

      # noctalia shell
      bind=SUPER,r,spawn,noctalia-shell ipc call launcher toggle
      bind=SUPER+ALT,b,spawn,noctalia-shell ipc call bar toggle
      bind=SUPER,w,spawn,noctalia-shell ipc call sessionMenu toggle
      bind=SUPER,t,spawn,noctalia-shell ipc call controlCenter toggle
      bind=SUPER,c,spawn,noctalia-shell ipc call calendar toggle
      bind=SUPER+SHIFT,w,spawn,noctalia-shell ipc call lockScreen lock

      # audio and brightness
      bind=NONE,XF86AudioMute,spawn,noctalia-shell ipc call volume muteOutput
      bind=NONE,XF86AudioLowerVolume,spawn,noctalia-shell ipc call volume decrease
      bind=NONE,XF86AudioRaiseVolume,spawn,noctalia-shell ipc call volume increase
      bind=NONE,XF86MonBrightnessDown,spawn,noctalia-shell ipc call brightness decrease
      bind=NONE,XF86MonBrightnessUp,spawn,noctalia-shell ipc call brightness increase
      bind=NONE,XF86AudioPrev,spawn,noctalia-shell ipc call media previous
      bind=NONE,XF86AudioPlay,spawn,noctalia-shell ipc call media playPause
      bind=NONE,XF86AudioNext,spawn,noctalia-shell ipc call media next

      # apps
      bind=SUPER,b,spawn,zen-beta
      bind=SUPER,Return,spawn,foot
      bind=SUPER+SHIFT,b,spawn,brave --incognito
      bind=SUPER,a,spawn,brave --app=https://chatgpt.com
      bind=SUPER,s,spawn,${pkgs.hyprshot}/bin/hyprshot -m region
      bind=SUPER,m,spawn,proton-mail
      bind=SUPER,p,spawn,proton-pass
      bind=SUPER,o,spawn,foot yazi ~/Documents/Books
      bind=SUPER,e,spawn,foot yazi
      bind=SUPER+SHIFT,e,spawn,thunar

      # exit
      bind=SUPER+SHIFT,q,quit
      bind=SUPER,q,killclient,

      # switch window focus
      bind=SUPER,Tab,focusstack,next
      bind=SUPER,h,focusdir,left
      bind=SUPER,l,focusdir,right
      bind=SUPER,k,focusdir,up
      bind=SUPER,j,focusdir,down

      # swap window
      bind=SUPER+SHIFT,Up,exchange_client,up
      bind=SUPER+SHIFT,Down,exchange_client,down
      bind=SUPER+SHIFT,Left,exchange_client,left
      bind=SUPER+SHIFT,Right,exchange_client,right

      # switch window status
      bind=SUPER,g,toggleglobal,
      bind=ALT,Tab,toggleoverview,
      bind=SUPER+SHIFT,f,togglefloating,
      bind=ALT,a,togglemaximizescreen,
      bind=SUPER,f,togglefullscreen,
      bind=ALT+SHIFT,f,togglefakefullscreen,
      bind=SUPER,i,minimized,
      bind=SUPER+SHIFT,o,toggleoverlay,
      bind=SUPER+SHIFT,I,restore_minimized
      bind=ALT,z,toggle_scratchpad

      # scroller layout
      bind=ALT,e,set_proportion,1.0
      bind=ALT,x,switch_proportion_preset,

      # switch layout
      bind=SUPER+ALT,s,switch_layout

      # tag switch
      bind=ALT,Left,viewtoleft,0
      bind=CTRL,Left,viewtoleft_have_client,0
      bind=ALT,Right,viewtoright,0
      bind=CTRL,Right,viewtoright_have_client,0
      bind=CTRL+SUPER,Left,tagtoleft,0
      bind=CTRL+SUPER,Right,tagtoright,0

      bind=SUPER,1,view,1,0
      bind=SUPER,2,view,2,0
      bind=SUPER,3,view,3,0
      bind=SUPER,4,view,4,0
      bind=SUPER,5,view,5,0
      bind=SUPER,6,view,6,0
      bind=SUPER,7,view,7,0
      bind=SUPER,8,view,8,0
      bind=SUPER,9,view,9,0

      # tag: move client to the tag and focus it
      # tagsilent: move client to the tag and not focus it
      bind=SUPER+SHIFT,1,tag,1,0
      bind=SUPER+SHIFT,2,tag,2,0
      bind=SUPER+SHIFT,3,tag,3,0
      bind=SUPER+SHIFT,4,tag,4,0
      bind=SUPER+SHIFT,5,tag,5,0
      bind=SUPER+SHIFT,6,tag,6,0
      bind=SUPER+SHIFT,7,tag,7,0
      bind=SUPER+SHIFT,8,tag,8,0
      bind=SUPER+SHIFT,9,tag,9,0

      # monitor switch
      bind=SUPER+shift,h,focusmon,left
      bind=SUPER+shift,l,focusmon,right
      bind=SUPER+Alt,h,tagmon,left
      bind=SUPER+Alt,l,tagmon,right

      # gaps
      bind=ALT+SHIFT,X,incgaps,1
      bind=ALT+SHIFT,Z,incgaps,-1
      bind=ALT+SHIFT,R,togglegaps

      # movewin
      bind=CTRL+SHIFT,Up,movewin,+0,-50
      bind=CTRL+SHIFT,Down,movewin,+0,+50
      bind=CTRL+SHIFT,Left,movewin,-50,+0
      bind=CTRL+SHIFT,Right,movewin,+50,+0

      # resizewin
      bind=SUPER,Up,resizewin,+0,-50
      bind=SUPER,Down,resizewin,+0,+50
      bind=SUPER,Left,resizewin,-50,+0
      bind=SUPER,Right,resizewin,+50,+0

      # Mouse Button Bindings
      # NONE mode key only work in ov mode
      mousebind=SUPER,btn_left,moveresize,curmove
      # mousebind=NONE,btn_middle,togglemaximizescreen,0
      mousebind=SUPER,btn_right,moveresize,curresize
      mousebind=NONE,btn_left,toggleoverview,1
      mousebind=NONE,btn_right,killclient,0

      # Axis Bindings
      axisbind=SUPER,UP,viewtoleft_have_client
      axisbind=SUPER,DOWN,viewtoright_have_client

      # monitors
      monitorrule=DP-2,0.5,1,scroller,0,1,0,0,3440,1440,180
      monitorrule=DP-1,0.5,1,scroller,0,1,3440,0,3440,1440,60
      monitorrule=eDP-1,0.5,1,scroller,0,1,0,0,1920,1080,60
    '';
  };
}
