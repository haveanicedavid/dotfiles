return {
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- optional
    opts = {
      snippetDir = "~/.config/nvim/snippets",
    },
    keys = {
      {
        "<leader>cse",
        "<Cmd>ScissorsEditSnippet<Cr>",
        desc = "Edit snippet",
        mode = { "n", "v" },
      },
      {
        "<leader>csa",
        "<Cmd>ScissorsAddNewSnippet<Cr>",
        desc = "Add snippet",
        mode = { "n", "v" },
      },
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "~/.config/nvim/snippets" },
      })
    end,
  },
}
