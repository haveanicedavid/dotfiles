return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    hide_root_node = true,
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["P"] = {
          "toggle_preview",
          config = { use_float = true, use_image_nvim = true },
        },
      },
    },
    -- event_handlers = {
    --   {
    --     event = "neo_tree_popup_input_ready",
    --     handler = function()
    --       -- enter input popup with normal mode by default.
    --       vim.cmd("stopinsert")
    --     end,
    --   },
    -- },
  },
}
