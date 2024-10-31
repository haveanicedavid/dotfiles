return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      question_header = "  David ",
      mappings = {
        reset = {
          normal = "<C-n>",
          insert = "<C-n>",
        },
        submit_prompt = {
          normal = "<C-CR>",
          insert = "<C-m>",
        },
      },
    },
    event = "VeryLazy",
    -- keys = {
    --   {
    --     "<leader>ccc",
    --     "<cmd>CopilotChat<cr> ",
    --     mode = { "x", "n" },
    --     desc = "Prompt",
    --   },
    --   {
    --     "<leader>cce",
    --     "<cmd>CopilotChatExplain<cr>",
    --     mode = { "x", "n" },
    --     desc = "Explain code",
    --   },
    --   {
    --     "<leader>cct",
    --     "<cmd>CopilotChatTests<cr>",
    --     mode = { "x", "n" },
    --     desc = "Generate tests",
    --   },
    --   {
    --     "<leader>ccr",
    --     "<cmd>CopilotChatReview<cr>",
    --     mode = "x",
    --     desc = "Review code",
    --   },
    --   {
    --     "<leader>ccR",
    --     "<cmd>CopilotChatRefactor<cr>",
    --     mode = "x",
    --     desc = "Refactor code",
    --   },
    --   {
    --     "<leader>cce",
    --     "<cmd>CopilotChatExplain<cr>",
    --     mode = "x",
    --     desc = "Explain code",
    --   },
    --   {
    --     "<leader>cct",
    --     "<cmd>CopilotChatTests<cr>",
    --     mode = "x",
    --     desc = " Generate tests",
    --   },
    --   {
    --     "<leader>ccf",
    --     "<cmd>CopilotChatFix<cr>",
    --     mode = "x",
    --     desc = "Fix",
    --   },
    -- },
  },
}
