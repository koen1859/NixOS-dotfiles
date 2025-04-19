{inputs, ...}: {
  programs.doom-emacs = {
    enable = true;
    doomDir = inputs.doom-config; # or e.g. `./doom.d` for a local configuration
  };
}
