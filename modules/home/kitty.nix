{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 1.0
      enable_audio_bell no
    '';
    shellIntegration = {
      mode = "no_rc";
      enableZshIntegration = true;
    };
  };
}
