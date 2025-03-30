{ ... }:

{  
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/bundle.nix
      ./packages/bundle.nix
      ../modules/bundle.nix
      ../packages/bundle.nix
    ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # Configure console keymap
  console.keyMap = "us";

  programs.hyprland.enable = true;
  programs.nix-ld.enable = true;

  system.stateVersion = "24.11";
}
