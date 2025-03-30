{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = false;
  };
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [
      nvtopPackages.amd
      nvtopPackages.intel
    ];
  };
}
