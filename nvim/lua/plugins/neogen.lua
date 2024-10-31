return {
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    keys = {
      {
        mode = { "n", "v" },
        "<leader>cad",
        "<cmd>Neogen<cr>",
        desc = "Generate neogen docs",
      },
    },
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
}
