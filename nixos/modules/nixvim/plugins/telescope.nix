{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      #"<leader>ff" = "find_files";
      #"<leader>b" = "buffers";
      #"<leader>fh" = "help_tags";
      #"<leader>gf" = "git_files";
      #"<leader>of" = "oldfiles";
      #"<leader>fg" = "live_grep";
      #"<leader>fd" = "diagnostics";
    };

    #keymapsSilent = true;

    settings.defaults = {
      file_ignore_patterns = [
        #"^.git/"
        #"%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };
}
