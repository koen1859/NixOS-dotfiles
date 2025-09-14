{
  inputs,
  config,
  pkgs,
  ...
}: let
  search = {
    force = true;
    default = "startpage";
    privateDefault = "startpage";

    engines = {
      google.metaData.hidden = true;
      ebay.metaData.hidden = true;
      qwant.metaData.hidden = true;
      bing.metaData.hidden = true;
      ddg.metaData.hidden = true;
      wikipedia.metaData.hidden = true;
      ecosia.metaData.hidden = true;
      startpage = {
        urls = [
          {
            template = "https://www.startpage.com/sp/search";
            params = [
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "https://www.startpage.com/favicon.ico";
        metaData.hidden = false;
        definedAliases = ["@sp"];
      };
    };
  };

  settings = {
    "privacy.resistFingerprinting.letterboxing" = true;
    "privacy.resistFingerprinting.pbmode" = true;
    "privacy.resistFingerprinting.randomization.canvas.disable_for_chrome" = true;
    "privacy.resistFingerprinting.randomization.canvas.use_siphash" = true;
    "privacy.resistFingerprinting.randomization.daily_reset.enabled" = true;
    "privacy.resistFingerprinting.randomization.daily_reset.private.enabled" = true;
    "privacy.resistFingerprinting.target_video_res" = 720;

    "webgl.disabled" = true;
    "media.peerconnection.enabled" = false;
    "beacon.enabled" = false;
    "dom.battery.enabled" = false;
    "dom.webaudio.enabled" = false;
    "device.sensors.enabled" = false;

    "permissions.default.camera" = 2;
    "permissions.default.microphone" = 2;
    "permissions.default.geo" = 2;
    "permissions.default.desktop-notification" = 2;

    "network.IDN_show_punycode" = true;

    "geo.enabled" = false;
    "geo.provider.use_corelocation" = false;
    "geo.provider.use_gpsd" = false;
    "geo.provider.use_geoclue" = false;
    "geo.provider.network.url" = "";

    "extensions.autoDisableScopes" = 0;

    "middlemouse.paste" = false;

    "browser.tabs.insertAfterCurrent" = true;
    "browser.tabs.warnOnClose" = true;
    "browser.toolbars.bookmarks.visibility" = "never";
    "browser.quitShortcut.disabled" = true;
    "browser.sessionstore.restore_pinned_tabs_on_demand" = true;

    "browser.newtabpage.activity-stream.showSearch" = false;
    "browser.newtabpage.activity-stream.newtabWallpapers.customColor.enabled" = true;
    "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper" = "solid-color-picker-#${config.lib.stylix.colors.base01}";

    "sidebar.position_start" = "left";
    "sidebar.verticalTabs" = true;
    "sidebar.visibility" = "expand-on-hover";
    "sidebar.main.tools" = "";
    "findbar.highlightAll" = true;

    "browser.theme.content-theme" = 2;
    "browser.theme.toolbar-theme" = 2;
    "ui.systemUsesDarkTheme" = 1;
    "layout.css.prefers-color-scheme.content-override" = 0;
  };
in {
  stylix.targets.librewolf.profileNames = ["default"];

  programs.librewolf = {
    enable = false;

    package = pkgs.librewolf.override {
      cfg.speechSynthesisSupport = false;
    };

    profiles = {
      default = {
        inherit settings search;
        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
          darkreader
          vimium
          privacy-badger
          canvasblocker
          i-dont-care-about-cookies
        ];
      };
    };
  };
}
