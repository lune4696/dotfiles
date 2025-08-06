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

      # xfce
      xfce.thunar # file viewer
      xfce.thunar-volman # thunar plugin for removable media
      xfce.thunar-vcs-plugin # thunar plugin for version control system
      xfce.thunar-media-tags-plugin # thunar plugin for tagging media files
      xfce.tumbler # thumbnailing daemon
      xfce.ristretto # photo viewer
      xfce.parole # media player
      xfce.xfburn # cd/dvd writer
      xfce.xfwm4-themes
      #xfce.xfdesktop
      xfce.xfce4-whiskermenu-plugin # app launcher
      xfce.xfce4-screenshooter # screen shot
      xfce.xfce4-icon-theme # icon
      xfce.libxfce4ui # widgets
    ];
  };
}
