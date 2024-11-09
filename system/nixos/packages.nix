{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [

      # Terminal&Editor
      alacritty
      kitty
      helix
      lunarvim
      vscode

      # for lunarvim
      chafa # for image support
      ffmpegthumbnailer
      imagemagick
      ripgrep
      ueberzug

      # CLI app
      bottom
      brightnessctl
      entr
      htop
      git
      gnutar
      lazygit
      neofetch
      #protonup
      ranger
      swww
      tree
      unzip
      usbutils
      wget
      wl-clipboard
      zip

      # GUI app
      arduino-ide
      #bottles
      chromium
      floorp
      #heroic
      #mangohud
      mpv
      pavucontrol
      thunderbird
      zoom-us

      # Screenshot
      grim
      slurp

      # programing language specific
      adafruit-nrfutil #arduino-ide need it
      gcc
      llvm
      marksman
      python312
      python312Packages.pillow
      pyright
      zig
      
      # Wayland/hyprland specific
      hyprland
      libnotify
      mako
      rofi-wayland
      waybar

      # About GPU
      amdvlk

      # Other
      home-manager
      wlroots
      pandoc
      pulseaudio
    ];
  };
}
