let
  username = import ../variables.nix username;
in {
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      trusted-users = ["root" "${username}"];
    };
  };
}
