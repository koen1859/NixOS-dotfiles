{config, ...}: {
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
      width = 500;
      show = "drun";
      prompt = "Search";
      height = 400;
      always_parse_args = true;
      show_all = true;
      term = "kitty";
      hide_scroll = true;
      print_command = true;
      insensitive = true;
      columns = 1;
    };
    style = ''
            * {
          font-family: 'CodeNewRoman Nerd Font Mono', monospace;
          font-size: 18px;
          outline: none;
          border: none;
          text-shadow:none;
          background-color:transparent;
      }
      window {
          all:unset;
          padding: 20px;
          border-radius: 0px;
          background-color: alpha(#${config.lib.stylix.colors.base00},.5);
      }
      #inner-box {
          margin: 2px;
          padding: 5px
          border: none;
      }
      #outer-box {
          border: none;
      }
      #scroll {
          margin: 0px;
          padding: 30px;
          border: none;
      }
      #input {
          all:unset;
          margin-left:20px;
          margin-right:20px;
          margin-top:20px;
          padding: 20px;
          border: none;
          outline: none;
          color: #${config.lib.stylix.colors.base08};
          box-shadow: 1px 1px 5px rgba(0, 0, 0, .5);
          border-radius:10;
          background-color: alpha(#${config.lib.stylix.colors.base00},.2);
      }
      #input image {
          border: none;
          color: #${config.lib.stylix.colors.base0F};
      }
      #input * {
          border: none;
          outline: none;
      }
      #input:focus {
          outline: none;
          border: none;
          border-radius:10;
      }
      #text {
          margin: 5px;
          border: none;
          color: #${config.lib.stylix.colors.base08};
          outline: none;
      }
      #entry {
          border: none;
          margin: 5px;
          padding-left: 10px;
          background-color:transparent !important;
      }
      #entry arrow {
          border: none;
          color:transparent;
          background-color:transparent !important;
      }
      #entry:selected {
          box-shadow: 1px 1px 5px rgba(255,255,255, .03);
          border: none;
          border-radius: 20px;
          background-color:transparent;
      }
      #entry:selected #text {
          color: #${config.lib.stylix.colors.base09};
      }
      #entry:drop(active) {
          background-color:transparent !important;
      }
      #entry:nth-child(odd) {
          background-color:transparent;
      }
      #entry:nth-child(even) {
          background-color:transparent;
      }
    '';
  };
}
