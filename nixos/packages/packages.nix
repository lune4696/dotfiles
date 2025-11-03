{ pkgs, inputs, ... }: {
  nixpkgs.config = {
    allowUnfree = false;
  };

  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [
      home-manager

      # terminal
      kitty

      # editor
      helix
      vim

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
      fastfetch

      # wayland
      wget
      wev
      wl-clipboard
      wtype
      wayland-scanner
      wlroots
      wlr-randr

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

      # file manager
      ranger
      kdePackages.dolphin

      # cli app
      tree

      # screenshot
      grim
      slurp

      # programing language specific
      # c
      clang
      gcc
      llvm
      cmake

      # markdown
      marksman

      # java
      jdk17
      jdk21
      clojure
      clojure-lsp
      clj-kondo
      leiningen

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
      inputs.zen-browser.packages."${system}".twilight
    ];
  };
}
