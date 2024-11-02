{ config, lib, pkgs, ... }: 

with lib; {
  options = {
    services.rofi = {
      widown = mkOption {
        width = "100%";
        height = "100%";
      };

      configuration = mkOption {
      	font = "JetBrainsMono NerdFont 15";
      };
    };
  };
}
