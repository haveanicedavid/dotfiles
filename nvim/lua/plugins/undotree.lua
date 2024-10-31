return {
  "debugloop/telescope-undo.nvim",
  config = function()
    vim.keymap.set(
      "n",
      "<leader>su",
      "<CMD>Telescope undo<CR>",
      { desc = "Search Undo Tree" }
    )
    require("telescope").load_extension("undo")
  end,
}
