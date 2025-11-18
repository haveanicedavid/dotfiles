return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
        ["*"] = {
          keys = {
            { "K", false },
          },
        },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
