{ config, pkgs, ... }:
{
  home.username = "miku";
  home.homeDirectory = "/home/miku";

  # No Touchy
  home.stateVersion = "24.05";
}
