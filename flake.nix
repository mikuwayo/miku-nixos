{
	description = "La config stream de Miku uwu";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

		nixos-wsl = {
			url = "github:nix-community/NixOS-WSL/main";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixos-wsl, ... }: {
		nixosConfigurations = {
			kirby = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";

				modules = [
					nixos-wsl.nixosModules.wsl
					./configuration.nix
				];
			};
		};
	};
}
