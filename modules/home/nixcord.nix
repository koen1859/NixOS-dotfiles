{
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;
    config = {
      frameless = true;
      plugins = {
        alwaysAnimate.enable = true;
        alwaysExpandRoles.enable = true;
        betterSessions = {
          enable = true;
          backgroundCheck = true;
          checkInterval = 20;
        };
        biggerStreamPreview.enable = true;
        fakeNitro.enable = true;
        fixSpotifyEmbeds.enable = true;
        gameActivityToggle.enable = true;
        memberCount.enable = true;
        noF1.enable = true;
        noPendingCount.enable = true;
        noReplyMention.enable = true;
        notificationVolume = {
          enable = true;
          notificationVolume = 0.0;
        };
        nsfwGateBypass.enable = true;
        permissionsViewer.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        silentMessageToggle.enable = true;
        spotifyControls.enable = true;
        webScreenShareFixes.enable = true;
      };
    };
  };
}
