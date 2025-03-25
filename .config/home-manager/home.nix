{ pkgs, ... }: {
  imports = [
    ./modules/bundle.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  
  home = {
    username = "lune";
    homeDirectory = "/home/lune";
    stateVersion = "24.11";
    packages = [
      pkgs.arduino-ide
      pkgs.floorp
      pkgs.helix
      pkgs.google-chrome
      pkgs.kicad
      pkgs.thunderbird
      pkgs.zoom-us
    ];
  };

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "floorp";
    TERMINAL = "kitty";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    GLFW_IM_MODULE = "ibus";
  };

  home.pointerCursor = 
  let 
    getFrom = url: hash: name: {
        gtk.enable = true;
        x11.enable = true;
        name = name;
        size = 48;
        package = 
          pkgs.runCommand "moveUp" {} ''
            mkdir -p $out/share/icons
            ln -s ${pkgs.fetchzip {
              url = url;
              hash = hash;
            }} $out/share/icons/${name}
        '';
      };
  in
    getFrom 
      "https://github.com/ful1e5/fuchsia-cursor/releases/download/v2.0.0/Fuchsia-Pop.tar.gz"
      "sha256-BvVE9qupMjw7JRqFUj1J0a4ys6kc9fOLBPx2bGaapTk="
      "Fuchsia-Pop";
}
