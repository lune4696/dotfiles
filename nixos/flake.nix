{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, zen-browser, ...}@inputs: 
    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable { inherit system; };
    in {
      nixosConfigurations = {
        wm2 = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
          };
          modules = [
            ./wm2/configuration.nix
            inputs.xremap-flake.nixosModules.default
            {
              environment.systemPackages = [
              ];
            }
          ];
        };
        jade57 = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs system pkgs-unstable;
          };
          modules = [
            ./jade57/configuration.nix
            inputs.xremap-flake.nixosModules.default {
              environment.systemPackages = [];
            }
          ];
        };
        mlab = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system pkgs-unstable;
          };
          modules = [
            ./mlab/configuration.nix
            inputs.xremap-flake.nixosModules.default
            {
              environment.systemPackages = [
              ];
            }
          ];
        };
      };
     homeConfigurations.lune = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
        modules = [ /home/lune/.config/home-manager/home.nix ];
      };
    };
}
