{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [

      # Terminal&Editor
      #alacritty
      kitty
      helix
      #lunarvim
      vscode

      ## for lunarvim
      #chafa # for image support

      # CLI app
      bottom
      brightnessctl
      entr
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
      hypridle
      hyprlang
      hyprpicker
      hyprutils
      hyprwayland-scanner

      # GUI app
      affine
      arduino-ide
      bottles
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
      clang
      cmake
      elixir
      gcc
      julia
      llvm
      marksman
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
