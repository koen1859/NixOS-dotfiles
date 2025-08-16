{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) username;
in {
  networking.networkmanager.enable = true;
  services.resolved.enable = true;
  systemd.services = {
    protonvpn = {
      description = "ProtonVPN Wireguard Service";
      wantedBy = ["multi-user.target"];
      after = ["network-online.target" "NetworkManager.service"];
      requires = ["network-online.target"];
      script = "${pkgs.wireguard-tools}/bin/wg-quick up /vpn/wg-NL-398.conf";
      serviceConfig = {
        Restart = "on-failure";
        RestartSec = 5;
        # ExecStop = "${pkgs.wireguard-tools}/bin/wg-quick down /vpn/wg-NL-398.conf";
      };
    };
  };
  hardware.bluetooth.enable = true;
}
