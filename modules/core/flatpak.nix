{pkgs, ...}: {
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak install --noninteractive flathub me.proton.Mail
      flatpak install --noninteractive flathub me.proton.Pass
    '';
  };
}
