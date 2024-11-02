{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [

      # Terminal&Editor
      alacritty
      helix
      vscode

      # CLI app
      bottom
      brightnessctl
      cargo
      git
      gnutar
      lazygit
      neofetch
      protonup
      ranger
      swww
      tree
      unzip
      wget
      zip

      # GUI app
      arduino-ide
      bottles
      chromium
      floorp
      heroic
      mangohud
      pavucontrol
      slack
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
      nim
      nimble
      python311
      pyright
      
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
