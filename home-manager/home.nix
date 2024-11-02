{
  imports = [
    ./modules/bundle.nix
  ];
  
  home = rec {
    username = "lune";
    homeDirectory = "/home/lune";
    stateVersion = "23.11";
  };

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "floorp";
    TERMINAL = "alacritty";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    GLFW_IM_MODULE = "ibus";
  };
}
