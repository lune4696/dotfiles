{ lib, pkgs, ... }: {
  nixpkgs.config = {
    nvidia.acceptLicense = true;
  };
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvtopPackages.full"
    ];
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [
      nvtopPackages.full
    ];
  };
}
