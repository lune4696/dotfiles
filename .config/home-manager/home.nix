{ lib, pkgs, ... }: {

  imports = [
    ./modules/bundle.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "adafruit-nrfutil"
      "google-chrome"
      "vscode"
      "zoom"
    ];

  nixpkgs.config.permittedInsecurePackages = [ "python3.12-ecdsa-0.19.1" ];

  # MIME 形式で GUI app の default application を切り替え
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/mailto" = "userapp-Thunderbird-IT4P22.desktop";
      "x-scheme-handler/mid" = "userapp-Thunderbird-IT4P22.desktop";
      "message/rfc822" = "userapp-Thunderbird-IT4P22.desktop";
      "inode/directory" = "dolphin.desktop";
    };
  };

  programs = {
    emacs = {
      enable = true;
      extraPackages = epkgs : [ epkgs.vterm ];
    };
  };

  #catppuccin = {
  #  enable = true;
  #  flavor = "mocha";
  #  accent = "blue";
  #};

  home = {
    username = "lune";
    homeDirectory = "/home/lune";
    stateVersion = "25.05";
    packages = with pkgs; [
      arduino-ide
      adafruit-nrfutil
      kitty
      google-chrome
      kicad
      thunderbird
      vscode
      zoom-us

      # emacs
      git
      ripgrep
      coreutils
      fd
      clang
      gnumake
      cmigemo
      direnv
      nix-direnv
      nodejs
      shellcheck
      isort
      pipenv
      uv
    ];
  };

  home.sessionVariables = {
    EDITOR = "emacs";
    BROWSER = "zen-browser";
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
