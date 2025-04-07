{pkgs, ...}: {
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak install --noninteractive -y flathub io.github.voxelcubes.hand-tex
    '';
  };
}
