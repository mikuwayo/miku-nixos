{ config, pkgs, ... }:

{
  # Enhance nix-shell for development
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  environment.systemPackages = with pkgs; [
    bunnyfetch # ₍ᐢ. .ᐢ₎
    nurl       # Fetch content with checksum to add to flakes
    niv        # A flakes alternative to projects
  ];
}
