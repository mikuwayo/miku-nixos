{ config, pkgs, ... }:
{
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	environment.systemPackages = with pkgs; [
		hello git tmux fish
		gnumake man-pages
		curl wget openssh openssl
	];

	programs.neovim = {
		enable = true;
		vimAlias = true;
		defaultEditor = true;
		configure = {
			customRC = ''
				set nocompatible
				set showmatch
				set hlsearch
				set incsearch
				set tabstop=2
				set softtabstop=2
				set expandtab
				set shiftwidth=2
				set autoindent
				set number
			'';
		};
	};

}
