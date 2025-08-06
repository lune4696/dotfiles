{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = false;
  };

  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [
      home-manager

      # Terminal
      kitty

      # Editor
      helix

      # compress/decompress
      gnutar
      zip
      unzip

      #git
      git
      lazygit

      # monitoring
      bottom
      htop
      neofetch
      
      # wayland
      wget
      wev
      wl-clipboard
      wtype
      wayland-scanner
      wlroots

      # hardware
      brightnessctl
      pavucontrol
      pulseaudio
      usbutils

      # hypr ecosystem
      hyprland
      hyprlang
      hyprlock
      hyprpicker
      hyprutils
      hyprwayland-scanner

      # desktop
      fusuma
      swww
      libnotify
      mako
      rofi-wayland
      waybar

      # bluetooth
      blueman
      bluetui
      bluez

      # filer
      dolphin # KDE 環境の標準ファイラーなので
      ranger
      tree

      # screenshot
      grim
      slurp

      # note app
      affine

      # programing language specific
      # c
      clang
      gcc
      llvm
      cmake
      # elixir
      elixir
      elixir-ls
      # markdown
      marksman
      # nix
      nil
      # python
      python314
      pyright
      # zig
      zig
      zls
      
      # other
      bottles
      mpv
      pandoc
    ];
  };
}
