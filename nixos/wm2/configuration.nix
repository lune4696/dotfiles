{ lib, ... }:

{  
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/bundle.nix
      ./packages.nix
    ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # Configure console keymap
  console.keyMap = "us";

  programs.hyprland.enable = true;
  programs.nix-ld.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "google-chrome"
  ];

  system.stateVersion = "24.11";
}
