-- if true then
--   return {}
-- end
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        biome = {
          root_dir = function(fname)
            return require("lspconfig").util.root_pattern("biome.json")(fname)
          end,
        },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.biome)
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      opts = function(_, opts)
        local nls = require("none-ls").builtins
        opts.sources = vim.list_extend(opts.sources or {}, {
          nls.formatting.biome,
        })
        opts.formatters_by_ft = {
          javascript = { "biome" },
          typescript = { "biome" },
          javascriptreact = { "biome" },
          typescriptreact = { "biome" },
          json = { "biome" },
        }
      end,
    },
  },
}
