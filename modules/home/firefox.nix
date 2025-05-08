{
  pkgs,
  inputs,
  ...
}: let
  search = {
    force = true;
    default = "google";
    privateDefault = "google";

    engines = {
      google.metaData.hidden = false;
      bing.metaData.hidden = true;
      ddg.metaData.hidden = true;
      wikipedia.metaData.hidden = true;
      ecosia.metaData.hidden = true;
    };
  };

  settings = {
    "extensions.autoDisableScopes" = 0;

    "middlemouse.paste" = false;

    "browser.download.useDownloadDir" = true;
    "browser.tabs.insertAfterCurrent" = true;
    "browser.tabs.warnOnClose" = true;
    "browser.toolbars.bookmarks.visibility" = "never";
    "browser.quitShortcut.disabled" = true;
    "browser.sessionstore.restore_pinned_tabs_on_demand" = true;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.newtabpage.activity-stream.showSearch" = false;
    "browser.newtabpage.activity-stream.showTopSites" = false;
    "browser.newtabpage.activity-stream.showBookmarks" = true;
    # "browser.newtabpage.activity-stream.topSiteWidth" = 6;

    "browser.translations.neverTranslateLanguages" = "Dutch";

    "browser.urlbar.suggest.bookmark" = true;
    "browser.urlbar.suggest.engines" = false;
    "browser.urlbar.suggest.history" = true;
    "browser.urlbar.suggest.openpage" = true;
    "browser.urlbar.suggest.topsites" = true;
    "browser.urlbar.trimHttps" = true;

    "browser.sessionstore.privacy_level" = 0;
    "browser.sessionstore.resume_from_crash" = true;
    "browser.sessionstore.max_resumed_crashes" = -1;

    "places.history.enabled" = true;
    "privacy.sanitize.sanitizeOnShutdown" = false;

    "dom.storage.enabled" = true;
    "dom.indexedDB.enabled" = true;
    "browser.cache.disk.enable" = true;
    "browser.cache.offline.enable" = true;

    "sidebar.position_start" = "left";
    "sidebar.verticalTabs" = true;
    "sidebar.visibility" = "expand-on-hover";
    "sidebar.main.tools" = "";
    "findbar.highlightAll" = true;

    "xpinstall.signatures.required" = false;

    "apz.overscroll.enabled" = false;
    "browser.tabs.hoverPreview.enabled" = true;

    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

    "identity.fxaccounts.enabled" = true;

    "media.autoplay.blocking_policy" = 2;

    "network.cookie.lifetimePolicy" = 0;
    "privacy.clearOnShutdown.cookies" = false;
    "privacy.clearOnShutdown.sessions" = false;
    "privacy.clearOnShutdown.siteSettings" = false;
    "privacy.resistFingerprinting.letterboxing" = false;

    "browser.theme.content-theme" = 2;
    "browser.theme.toolbar-theme" = 2;
    "ui.systemUsesDarkTheme" = 1;
    "layout.css.prefers-color-scheme.content-override" = 0;

    "dom.security.https_only_mode" = true;
    "dom.security.https_only_mode_ever_enabled" = true;
    "dom.security.https_only_mode.upgrade_local" = true;

    "network.trr.mode" = 3;
    "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
    "network.trr.bootstrapAddress" = "1.1.1.1";
    "network.trr.confirmationNS" = "example.com";
    "network.dns.disablePrefetch" = true;
    "network.dns.echconfig.enabled" = true;
    "network.dns.use_https_rr_as_altsvc" = true;
  };
in {
  stylix.targets.firefox.profileNames = ["default"];

  programs.firefox = {
    enable = true;

    profiles = {
      default = {
        inherit settings search;
        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          bitwarden
          ublock-origin
          sponsorblock
          darkreader
          youtube-shorts-block
          vimium
          privacy-badger
          canvasblocker
          i-dont-care-about-cookies
          proton-pass
          proton-vpn
        ];
      };
    };
  };
}
