-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.colorscheme = "retrobox"

lvim.transparent_window = true

lvim.leader = "space"

lvim.builtin.telescope.defaults.layout_config.width = 0.9
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 40
lvim.builtin.telescope.theme = "center"
lvim.builtin.telescope.pickers.find_files.hidden = false

lvim.plugins = {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  {
    'nvim-telescope/telescope-media-files.nvim',

    config = function (telescope)
      pcall(telescope.load_extension, "media_files")
      --require("telescope").extensions.media_files.media_files()
    end,
  },
}

--lvim.clipboard = "unnameplus"
