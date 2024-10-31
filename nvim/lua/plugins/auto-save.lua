return {
  {
    "https://git.sr.ht/~nedia/auto-save.nvim",
    event = { "BufReadPre" },
    opts = {
      events = { "BufLeave", "focusLost" },
      silent = false,
      exclude_ft = { "neo-tree" },
    },
  },
}
