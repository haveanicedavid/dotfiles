return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = { lsp = { auto_attach = true } },
      keys = {
        { "<leader>n", "<cmd>Navbuddy<cr>", desc = "Navbuddy" },
      },
    },
  },
  -- your lsp config or other stuff
}
