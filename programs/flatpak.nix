{ config, lib, pkgs, ... }:

{
  home.activation.installFlatpakApps = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    flatpak install -y --noninteractive flathub com.warlordsoftwares.youtube-downloader-4ktube
  '';
}
