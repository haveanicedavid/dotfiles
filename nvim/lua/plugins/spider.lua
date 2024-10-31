return {
  {
    "chrisgrieser/nvim-spider",
    cond = function()
      return (not not vim.g.vscode) or not vim.g.vscode
    end,
    keys = {
      { -- example for lazy-loading on keystroke
        "gw",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n" },
        remap = true,
      },
      {
        "ge",
        "<cmd>lua require('spider').motion('e')<CR>",
        desc = "SpiderMotion - e",
        mode = { "n" },
      },
      {
        "gb",
        "<cmd>lua require('spider').motion('b')<CR>",
        desc = "SpiderMotion - b",
        mode = { "n" },
      },
      {
        "<leader>e",
        "<cmd>lua require('spider').motion('e')<CR>",
        desc = "SpiderMotion - e",
        mode = { "o", "x", "v" },
      },
      {
        "<leader>w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "o", "x", "v" },
        desc = "SpiderMotion - w",
      },
      {
        "<leader>b",
        "<cmd>lua require('spider').motion('b')<CR>",
        desc = "SpiderMotion - b",
        mode = { "o", "x", "v" },
      },
    },
  },
}
