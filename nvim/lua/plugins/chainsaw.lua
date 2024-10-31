return {
  "chrisgrieser/nvim-chainsaw",
  keys = {
    {
      "gl",
      "<cmd>lua require('chainsaw').variableLog()<cr>",
      desc = "Log variable",
    },
    {
      "gL",
      "<cmd>lua require('chainsaw').removeLogs()<cr>",
      desc = "Remove chainsaw logs",
    },
  },
}
