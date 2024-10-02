# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
	wsl = {
		enable = true;
		defaultUser = "miku";
	};
   
   	users.mutableUsers = false;

	users.users.miku = {
		createHome = true;
		isNormalUser = true;

		password = "hihi";
		group = "users";
		extraGroups = [ "wheel" ];
	};
  
  	security.sudo = {
		execWheelOnly = true;

		defaultOptions = [
			"SETENV"
			"PASSWD" # Doesn't ask passwd by default for some reason
		];
	};

	networking.hostName = "kirby";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	environment.systemPackages = with pkgs; [ hello git neovim tmux fish emacs ];

	# No Touchy.
	system.stateVersion = "24.05";
} 
