{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.8;

      font = {
        size = 16.0;
        # draw_bold_text_with_bright_colors = true;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
      };

      colors.primary = {
        foreground = "0xcdcdcf";
        background = "0x282e2b";
      };
    };
  };
}
