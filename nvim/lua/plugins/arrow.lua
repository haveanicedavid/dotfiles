return {
  "otavioschwanck/arrow.nvim",
  enabled = not vim.g.vscode, -- disable in VSCode
  opts = {
    show_icons = true,
    leader_key = "m", -- Recommended to be a single key
    buffer_leader_key = "'", -- Per Buffer Mappings
    separate_by_branch = false,
    mappings = {
      edit = "e",
      delete_mode = "x",
      clear_all_items = "C",
      toggle = "w",
      open_vertical = "v",
      open_horizontal = "-",
      quit = "q",
      remove = "x",
      next_item = "]",
      prev_item = "[",
    },
    index_keys = "asdfjkl;ASDFJKL:",
  },
  config = function(_, opts)
    require("arrow").setup(opts)

    require("arrow.statusline").is_on_arrow_file()
    require("arrow.statusline").text_for_statusline_with_icons()
  end,
}
