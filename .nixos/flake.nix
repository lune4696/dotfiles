{
  description = "Lune's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs: 
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        wm2 = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs system;
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
            inherit inputs system;
          };
          modules = [
            ./jade57/configuration.nix
            inputs.xremap-flake.nixosModules.default
            {
              environment.systemPackages = [
              ];
            }
          ];
        };
        mlab = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs system;
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
        modules = [ /home/lune/.config/home-manager/home.nix ];
      };
    };
}
