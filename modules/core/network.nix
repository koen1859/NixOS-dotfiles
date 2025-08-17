{pkgs, ...}: {
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  services.resolved.enable = true;

  systemd.services = {
    protonvpn = {
      description = "ProtonVPN Wireguard Service";
      wantedBy = ["multi-user.target"];
      after = ["network-online.target" "NetworkManager.service"];
      requires = ["network-online.target"];
      script = "${pkgs.wireguard-tools}/bin/wg-quick up /vpn/wg.conf";
      serviceConfig = {
        Restart = "on-failure";
        RestartSec = 5;
      };
    };
  };

  hardware.bluetooth.enable = true;
}
