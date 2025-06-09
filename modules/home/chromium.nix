{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    extensions = [
      {id = "gcbommkclmclpchllfjekcdonpmejbdp";} # https everywhere
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
      {id = "dbepggeogbaibhgnhhndojpepiihcmeb";} # vimium
    ];
  };
}
