return {
  {
    "ojroques/nvim-osc52",
    keys = {
      {
        "<leader>y",
        "<CMD>lua require('osc52').copy_visual()<CR>",
        desc = "Copy to system clipboard",
        mode = "v",
      },
    },
  },
}
