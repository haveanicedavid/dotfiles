return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    {
      "gS",
      "<Cmd>lua require('treesj').toggle()<Cr>",
      desc = "Toggle split / join",
    },
  },
}
