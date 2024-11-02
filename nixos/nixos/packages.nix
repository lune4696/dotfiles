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
      git
      gnutar
      lazygit
      neofetch
      ranger
      swww
      tree
      unzip
      wget
      zip

      # GUI app
      arandr
      arduino-ide
      chromium
      floorp
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
      glaxnimate

      # Other
      home-manager
    ];
  };
}
