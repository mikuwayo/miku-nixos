{ config, pkgs, ... }:
{
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	environment.shellAliases = { vim = "nvim"; };
	environment.systemPackages = with pkgs; [
		hello git tmux fish
		neovim gnumake man-pages
		curl wget openssh openssl
	];
}
