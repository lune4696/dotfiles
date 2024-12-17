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
      lunarvim
      vscode

      # for lunarvim
      chafa # for image support

      # for c
      cmake

      # CLI app
      bottom
      brightnessctl
      entr
      htop
      git
      gnutar
      lazygit
      neofetch
      poop
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
      bottles
      chromium
      floorp
      google-chrome
      kicad
      mpv
      pavucontrol
      thunderbird
      zoom-us

      # Screenshot
      grim
      slurp

      # programing language specific
      adafruit-nrfutil #arduino-ide need it
      elixir
      gcc
      llvm
      marksman
      python312
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
      openblas
      pandoc
      pulseaudio
      wayland-scanner
      wlroots
    ];
  };
}
