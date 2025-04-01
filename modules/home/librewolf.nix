{pkgs, ...}: let
  search = {
    force = true;
    default = "DuckDuckGo";
    privateDefault = "DuckDuckGo";

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

    "browser.urlbar.suggest.bookmark" = false;
    "browser.urlbar.suggest.engines" = false;
    "browser.urlbar.suggest.history" = false;
    "browser.urlbar.suggest.openpage" = false;
    "browser.urlbar.suggest.topsites" = false;
    "browser.urlbar.trimHttps" = true;

    "sidebar.position_start" = false;
    "findbar.highlightAll" = true;

    "xpinstall.signatures.required" = false;

    "apz.overscroll.enabled" = false;
    "browser.tabs.hoverPreview.enabled" = true;

    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
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
