-- Use tab to accept copilot suggestions
if not vim.g.vscode then
  vim.keymap.set("i", "<Tab>", function()
    if require("copilot.suggestion").is_visible() then
      require("copilot.suggestion").accept()
    else
      vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
        "n",
        false
      )
    end
  end, {
    silent = true,
    desc = "Accept copilot suggestion or regular tab",
  })
end

return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cond = not vim.g.vscode,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    cond = not vim.g.vscode,
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api
              .nvim_buf_get_lines(0, line - 1, line, true)[1]
              :sub(col, col)
              :match("%s")
            == nil
      end

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          elseif cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
