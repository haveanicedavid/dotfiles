-- NOTE: Most of this is copy-paste from Lazyvim's default config:
-- https://www.lazyvim.org/plugins/ui#bufferlinenvim
return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    event = "VeryLazy",
    keys = function() -- function to override default maps
      return {
        { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
        {
          "<leader>bP",
          "<Cmd>BufferLineGroupClose ungrouped<CR>",
          desc = "Delete non-pinned buffers",
        },
        {
          "<leader>bo",
          "<Cmd>BufferLineCloseOthers<CR>",
          desc = "Delete other buffers",
        },
        {
          "<leader>bl",
          "<Cmd>BufferLineCloseRight<CR>",
          desc = "Delete buffers to the right",
        },
        {
          "<leader>bh",
          "<Cmd>BufferLineCloseLeft<CR>",
          desc = "Delete buffers to the left",
        },
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      }
    end,
    opts = {
      options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = false,
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd("BufAdd", {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },
}
