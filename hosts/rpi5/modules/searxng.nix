{
  config,
  lib,
  ...
}: {
  services.searx = {
    enable = true;
    redisCreateLocally = true;

    limiterSettings = {
      real_ip = {
        x_for = 1;
        ipv4_prefix = 32;
        ipv6_prefix = 56;
      };

      botdetection = {
        ip_limit = {
          filter_link_local = true;
          link_token = true;
        };
      };
    };

    settings = {
      general = {
        debug = false;
        instance_name = "SearXNG";
        donation_url = false;
        contact_url = false;
        privacypolicy_url = false;
        enable_metrics = false;
      };

      ui = {
        static_use_hash = true;
        # default_locale = "en";
        query_in_title = true;
        infinite_scroll = false;
        center_alignment = true;
        default_theme = "simple";
        theme_args.simple_style = "auto";
        search_on_category_select = false;
        hotkeys = "vim";
      };

      search = {
        safe_search = 2;
        autocomplete_min = 2;
        autocomplete = "duckduckgo";
        ban_time_on_fail = 5;
        max_ban_time_on_fail = 120;
      };

      server = {
        base_url = "https://search.koenstevens.nl";
        port = 8888;
        bind_address = "127.0.0.1";
        secret_key = config.sops.secrets.searx.path;
        limiter = true;
        public_instance = true;
        image_proxy = true;
        method = "GET";
      };

      engines = lib.mapAttrsToList (name: value: {inherit name;} // value) {
        "duckduckgo".disabled = true;
        "brave".disabled = false;
        "bing".disabled = false;
        "mojeek".disabled = true;
        "mwmbl".disabled = true;
        "mwmbl".weight = 0.4;
        "qwant".disabled = true;
        "crowdview".disabled = true;
        "crowdview".weight = 0.5;
        "curlie".disabled = true;
        "ddg definitions".disabled = false;
        "ddg definitions".weight = 2;
        "wikibooks".disabled = true;
        "wikidata".disabled = true;
        "wikiquote".disabled = true;
        "wikisource".disabled = true;
        "wikispecies".disabled = true;
        "wikispecies".weight = 0.5;
        "wikiversity".disabled = true;
        "wikiversity".weight = 0.5;
        "wikivoyage".disabled = true;
        "wikivoyage".weight = 0.5;
        "currency".disabled = true;
        "dictzone".disabled = true;
        "lingva".disabled = true;
        "bing images".disabled = false;
        "brave.images".disabled = true;
        "duckduckgo images".disabled = true;
        "google images".disabled = false;
        "qwant images".disabled = true;
        "1x".disabled = true;
        "artic".disabled = true;
        "deviantart".disabled = true;
        "flickr".disabled = true;
        "imgur".disabled = true;
        "library of congress".disabled = true;
        "material icons".disabled = true;
        "material icons".weight = 0.2;
        "openverse".disabled = true;
        "pinterest".disabled = true;
        "svgrepo".disabled = true;
        "unsplash".disabled = true;
        "wallhaven".disabled = true;
        "wikicommons.images".disabled = true;
        "yacy images".disabled = true;
        "bing videos".disabled = true;
        "brave.videos".disabled = true;
        "duckduckgo videos".disabled = true;
        "google videos".disabled = false;
        "qwant videos".disabled = true;
        "dailymotion".disabled = true;
        "google play movies".disabled = true;
        "invidious".disabled = true;
        "odysee".disabled = true;
        "peertube".disabled = true;
        "piped".disabled = true;
        "rumble".disabled = true;
        "sepiasearch".disabled = true;
        "vimeo".disabled = true;
        "youtube".disabled = false;
        "brave.news".disabled = true;
        "google news".disabled = true;
      };

      outgoing = {
        request_timeout = 5.0;
        max_request_timeout = 15.0;
        pool_connections = 100;
        pool_maxsize = 15;
        enable_http2 = true;
      };

      enabled_plugins = [
        "Basic Calculator"
        "Hash plugin"
        "Tor check plugin"
        "Open Access DOI rewrite"
        "Hostnames plugin"
        "Unit converter plugin"
        "Tracker URL remover"
      ];
    };
  };
  systemd.services.nginx.serviceConfig.ProtectHome = false;

  users.groups.searx.members = ["nginx"];

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "search.koenstevens.nl" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8888";
        };
      };
    };
  };
}
