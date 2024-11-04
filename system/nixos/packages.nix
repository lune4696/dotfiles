{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [

      # Terminal&Editor
      alacritty
      lunarvim
      helix
      vscode

      # CLI app
      bottom
      brightnessctl
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
      zip

      # GUI app
      arduino-ide
      #bottles
      chromium
      floorp
      #heroic
      #mangohud
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
      python311
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
