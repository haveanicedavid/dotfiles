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
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" and node:is_expanded() then
            require("neo-tree.sources.filesystem").toggle_directory(state, node)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        ["H"] = "toggle_hidden",
        ["gh"] = "toggle_hidden",
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
