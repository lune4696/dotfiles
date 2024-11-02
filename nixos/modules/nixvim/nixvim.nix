{
  imports = [
    ./plugins/bundle.nix
  ];

  programs.nixvim = {
    enable = true;
    #defaultEditor = true;
    colorschemes.everforest.enable = true;
  };
}
