{
  config,
  pkgs,
  inputs,
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
      "Nix Packages" = {
        urls = [
          {
            template = "https://search.nixos.org/packages?channel=unstable";
            params = [
              {
                name = "type";
                value = "packages";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = ["@np"];
      };
    };
  };

  settings = {
    "toolkit.telemetry.enabled" = false;
    "toolkit.telemetry.unified" = false;
    "toolkit.telemetry.server" = "";
    "toolkit.telemetry.archive.enabled" = false;
    "toolkit.telemetry.newProfilePing.enabled" = false;
    "toolkit.telemetry.shutdownPingSender.enabled" = false;
    "toolkit.telemetry.updatePing.enabled" = false;
    "toolkit.telemetry.bhrPing.enabled" = false;
    "toolkit.telemetry.firstShutdownPing.enabled" = false;

    "datareporting.healthreport.uploadEnabled" = false;
    "datareporting.policy.dataSubmissionEnabled" = false;

    "browser.newtabpage.activity-stream.feeds.telemetry" = false;
    "browser.newtabpage.activity-stream.telemetry" = false;
    "browser.ping-centre.telemetry" = false;

    "app.shield.optoutstudies.enabled" = false;
    "app.normandy.enabled" = false;
    "app.normandy.api_url" = "";

    "privacy.donottrackheader.enabled" = true;
    "privacy.donottrackheader.value" = 1;
    "privacy.resistFingerprinting" = false;
    "privacy.firstparty.isolate" = true;
    "privacy.trackingprotection.enabled" = true;
    "privacy.trackingprotection.fingerprinting.enabled" = true;
    "privacy.trackingprotection.cryptomining.enabled" = true;
    "privacy.trackingprotection.socialtracking.enabled" = true;

    "network.http.referer.XOriginPolicy" = 2;
    "network.http.referer.XOriginTrimmingPolicy" = 2;
    "network.http.sendRefererHeader" = 1;

    "webgl.disabled" = true;
    "media.peerconnection.enabled" = false;
    "beacon.enabled" = false;
    "dom.battery.enabled" = false;
    "dom.webaudio.enabled" = false;
    "device.sensors.enabled" = false;

    "network.IDN_show_punycode" = true;

    "permissions.default.camera" = 2;
    "permissions.default.microphone" = 2;
    "permissions.default.geo" = 2;
    "permissions.default.desktop-notification" = 2;

    "geo.enabled" = false;
    "geo.provider.use_corelocation" = false;
    "geo.provider.use_gpsd" = false;
    "geo.provider.use_geoclue" = false;
    "geo.provider.network.url" = "";

    "extensions.autoDisableScopes" = 0;

    "middlemouse.paste" = false;

    "signon.rememberSignons" = false;

    "browser.download.useDownloadDir" = false;
    "browser.tabs.insertAfterCurrent" = true;
    "browser.tabs.warnOnClose" = true;
    "browser.toolbars.bookmarks.visibility" = "never";
    "browser.quitShortcut.disabled" = true;
    "browser.sessionstore.restore_pinned_tabs_on_demand" = true;

    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.newtabpage.activity-stream.showSearch" = false;
    "browser.newtabpage.activity-stream.showTopSites" = false;
    "browser.newtabpage.activity-stream.showBookmarks" = true;
    "browser.newtabpage.activity-stream.topSiteWidth" = 6;
    "browser.newtabpage.activity-stream.newtabWallpapers.customColor.enabled" = true;
    "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper" = "solid-color-picker-#${config.lib.stylix.colors.base01}";

    "browser.translations.neverTranslateLanguages" = "Dutch";

    "browser.urlbar.suggest.bookmark" = true;
    "browser.urlbar.suggest.engines" = false;
    "browser.urlbar.suggest.history" = true;
    "browser.urlbar.suggest.openpage" = true;
    "browser.urlbar.suggest.topsites" = true;
    "browser.urlbar.trimHttps" = true;

    "sidebar.position_start" = "left";
    "sidebar.verticalTabs" = true;
    "sidebar.visibility" = "expand-on-hover";
    "sidebar.main.tools" = "";
    "findbar.highlightAll" = true;

    "browser.theme.content-theme" = 2;
    "browser.theme.toolbar-theme" = 2;
    "ui.systemUsesDarkTheme" = 1;
    "layout.css.prefers-color-scheme.content-override" = 2;
  };
in {
  stylix.targets.firefox.profileNames = ["default"];

  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        inherit settings search;
        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
          sponsorblock
          # darkreader
          youtube-shorts-block
          vimium
          privacy-badger
          canvasblocker
          i-dont-care-about-cookies
          proton-pass
        ];
      };
    };
  };
}
