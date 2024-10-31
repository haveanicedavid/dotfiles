return {
  "romgrk/barbar.nvim",
  event = "BufEnter",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  keys = {
    {
      mode = { "n" },
      "H",
      "<Cmd>BufferPrevious<CR>",
      desc = "Previous buffer",
    },
    {
      mode = { "n" },
      "L",
      "<Cmd>BufferNext<CR>",
      desc = "Previous buffer",
    },
    {
      mode = { "n" },
      "<A-,>",
      "<Cmd>BufferMovePrevious<CR>",
      desc = "Move buffer left",
    },
    {
      mode = { "n" },
      "<A-.>",
      "<Cmd>BufferMoveNext<CR>",
      desc = "Move buffer right",
    },
    {
      mode = { "n" },
      "<leader>bp",
      "<Cmd>BufferPin<CR>",
      desc = "Pin buffer",
    },
    {
      mode = { "n" },
      "<leader>bd",
      "<Cmd>BufferClose<CR>",
      desc = "Close buffer",
    },
    {
      mode = { "n" },
      "<leader>bo",
      "<Cmd>BufferCloseAllButCurrent<CR>",
      desc = "Close other buffers",
    },
    {
      mode = { "n" },
      "<leader>bP",
      "<Cmd>BufferCloseAllButCurrentOrPinned<CR>",
      desc = "Close other buffers",
    },
    {
      mode = { "n" },
      "<leader>bh",
      "<Cmd>BufferCloseBuffersLeft<CR>",
      desc = "Close other buffers",
    },
    {
      mode = { "n" },
      "<leader>bl",
      "<Cmd>BufferCloseBuffersRight<CR>",
      desc = "Close other buffers",
    },
    {
      mode = { "n" },
      "<leader>bb",
      "<Cmd>BufferPick<CR>",
      desc = "Select buffer",
    },
  },
  opts = {
    minimum_padding = 2,
    maximum_padding = 1,
    sidebar_filetypes = {
      ["neo-tree"] = { event = "BufWipeout" },
    },
    icons = {
      filetype = {
        enabled = false,
      },
      visible = { filetype = { enabled = true } },
      current = { filetype = { enabled = true } },
    },
  },
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
