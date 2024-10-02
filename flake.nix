{
  description = "La config stream de Miku uwu";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }@inputs: {
    nixosConfigurations = {
      kirby = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./cant-build-if-dirty-git-tree.nix
          { _module.args = { inherit inputs; }; }

          nixos-wsl.nixosModules.wsl

          ./kirby.nix
          ./core.nix
          ./dev.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs   = true; # Use flake's nixpkgs
            home-manager.useUserPackages = true; # Needed for rebuild build-vm
            home-manager.users.miku      = import ./miku.nix;
          }
        ];
      };
    };
  };
}
