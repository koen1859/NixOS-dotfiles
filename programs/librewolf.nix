{ config, lib, pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    profiles = {
      koenstevens = { };
    };
  };
}
