{
  imports = [
    ./lsp.nix
    ./telescope.nix
  ];

  programs.nixvim.plugins = {
    nix.enable = true;
    mini = {
      enable = true;
      modules.icons = {};
      mockDevIcons = true;
    };
  };
}
