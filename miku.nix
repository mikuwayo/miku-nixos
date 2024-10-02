{ config, pkgs, ... }:
{
  home = {
    username = "miku";
    homeDirectory = "/home/miku";

    packages = with pkgs; [

    ];

    file = {
      "conf.d" = {
        source = ./fish/conf.d;
        target = ".config/fish/conf.d";
        recursive = true;
      };

      "functions" = {
        source = ./fish/functions;
        target = ".config/fish/";
        recursive = true;
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Miku";
    userEmail = "mikuwayo@protonmail.com";
  };

  programs.emacs.enable = true;

  # No Touchy
  home.stateVersion = "24.05";
}
