{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "koen1859";
    userEmail = "koenstevens1859@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
