{pkgs, ...}: let
  search = {
    force = true;
    default = "ddg";
    privateDefault = "ddg";

    engines = {
      google.metaData.hidden = true;
      bing.metaData.hidden = true;
      ddg.metaData.hidden = true;
      wikipedia.metaData.hidden = true;
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

    "browser.urlbar.suggest.bookmark" = true;
    "browser.urlbar.suggest.engines" = false;
    "browser.urlbar.suggest.history" = true;
    "browser.urlbar.suggest.openpage" = true;
    "browser.urlbar.suggest.topsites" = true;
    "browser.urlbar.trimHttps" = true;

    "browser.newtabpage.activity-stream.showSearch" = false;

    "sidebar.position_start" = "left";
    "sidebar.verticalTabs" = true;
    "findbar.highlightAll" = true;

    "xpinstall.signatures.required" = false;

    "apz.overscroll.enabled" = false;
    "browser.tabs.hoverPreview.enabled" = true;

    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

    "identity.fxaccounts.enabled" = true;

    "media.autoplay.blocking_policy" = 2;

    "privacy.resistFingerprinting.letterboxing" = true;
  };
in {
  stylix.targets.librewolf.profileNames = ["default"];

  programs.librewolf = {
    enable = true;

    package = pkgs.librewolf.override {
      cfg.speechSynthesisSupport = false;
    };

    profiles = {
      default = {
        inherit settings search;
      };
    };
  };
}
