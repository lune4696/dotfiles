{ lib, pkgs, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
      #package = pkgs.steam.override {
      #  withPrimus = true;
      #  withJava = true;
      #  extraPkgs = [ pkgs.bumblebee pkgs.glxinfo ];
      #};
    };
    java.enable = true;
    gamemode.enable = true;
  };
  environment.systemPackages = with pkgs; [
    glxinfo
    mangohud
    protonplus
    vkd3d-proton
  ];
}
