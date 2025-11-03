{ pkgs, ... }:

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

  programs = {
    hyprland.enable = true;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib  # これが libstdc++.so.6 を提供
        libGL
        glib
        libglvnd
        zlib
        # 念のため他の一般的な依存関係も
        glibc
      ];
    };
    zsh.enable = true;
  };

  system.stateVersion = "25.05";
  users.defaultUserShell = pkgs.zsh;
}
