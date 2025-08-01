{pkgs, ...}: {
  services.flatpak = {
    enable = true;
  };
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      # flatpak install --noninteractive flathub me.proton.Mail
      # flatpak install --noninteractive flathub me.proton.Pass
      # flatpak install --noninteractive flathub com.github.tchx84.Flatseal
      # flatpak install --noninteractive flathub org.gimp.GIMP
      # flatpak install --noninteractive flathub io.freetubeapp.FreeTube
    '';
  };
}
