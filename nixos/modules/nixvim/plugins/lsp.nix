{
  programs.nixvim.plugins = {

    treesitter = {
      enable = true;
      folding = false;
      nixvimInjections = true;
      settings.indent.enable = true;
    };

    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
      };
    };
  };
}
