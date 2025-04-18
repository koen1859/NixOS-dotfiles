{pkgs, ...}: {
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak install --noninteractive -y flathub io.github.voxelcubes.hand-tex
      flatpak install --noninteractive -y flathub com.github.tchx84.Flatseal
      flatpak install --noninteractive -y flathub app.zen_browser.zen
    '';
  };
}
