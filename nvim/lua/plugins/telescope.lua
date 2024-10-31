return {
  {
    "telescope.nvim",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      -- { "nvim-telescope/telescope-media-files.nvim" },
    },
    config = function()
      local telescope = require("telescope")
      -- telescope.load_extension("media_files")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", "dist", "/build/" },
        },
        -- media_files = {
        --   -- filetypes whitelist
        --   -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        --   filetypes = { "png", "webp", "jpg", "jpeg", "svg", "webm" },
        --   -- find command (defaults to `fd`)
        --   -- find_cmd = "rg",
        -- },
      })
    end,
    keys = {
      {
        "<leader>gt",
        "<Cmd>Telescope git_files<Cr>",
        desc = "Telescope git files",
        mode = { "n" },
      },
      {
        "<leader>?",
        "<Cmd>Telescope resume<Cr>",
        desc = "Resume prior search",
        mode = { "n" },
      },
    },
  },
}
