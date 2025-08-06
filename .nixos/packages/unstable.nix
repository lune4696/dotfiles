{ pkgs-unstable, ... }: {
  nixpkgs = {
    config = {
      allowUnfree = false;
      permittedInsecurePackages = [
        # "electron-27.3.11"
      ];
    };
  };

  environment = {
    pathsToLink = ["/libexec"];

    systemPackages = with pkgs-unstable; [
      electron
      # note app
      logseq
    ];
  };
}
