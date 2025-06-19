{
  programs.qutebrowser = {
    settings = {
      auto_save.session = true;
      content = {
        cookies.accept = "no-3rdparty";
        notifications.enabled = false;
      };
      scrolling.smooth = true;
      url = {
        default_page = "https://www.startpage.com";
        start_pages = "https://www.startpage.com";
      };
      tabs = {
        position = "left";
        show = "switching";
        last_close = "close";
      };
    };
    searchEngines = {
      DEFAULT = "https://www.startpage.com/sp/search?query={}";
      np = "https://search.nixos.org/packages?channel=unstable&type=packages&query={}";
      yt = "https://www.youtube.com/results?search_query={}";
    };
  };
}
