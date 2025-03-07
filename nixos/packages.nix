{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true;
  };
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [

      # Terminal&Editor
      kitty
      helix
      vscode

      # CLI app
      bottom
      brightnessctl
      fusuma
      htop
      git
      gnutar
      lazygit
      libinput
      neofetch
      poop
      ranger
      swww
      tree
      unzip
      usbutils
      wget
      wl-clipboard
      wtype
      zip
      # hypr ecosystem
      hyprlang
      hyprpicker
      hyprutils
      hyprwayland-scanner

      # GUI app
      bottles
      mpv
      pavucontrol

      # Screenshot
      grim
      slurp

      # programing language specific
      adafruit-nrfutil #arduino-ide need it
      clang
      cmake
      elixir
      elixir-ls
      gcc
      llvm
      marksman
      nil
      python314
      pyright
      zig
      zls
      
      # desktop environment
      hyprland
      libnotify
      mako
      rofi-wayland
      waybar

      # Other
      home-manager
      pandoc
      pulseaudio
      wayland-scanner
      wlroots
    ];
  };
}
