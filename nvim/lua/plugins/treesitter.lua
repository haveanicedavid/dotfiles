return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      -- i honestly don't know why this is necessary but mdx doesn't render without
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown" })
        vim.treesitter.language.register("markdown", "mdx")
      end
      vim.list_extend(opts.ensure_installed, {
        "astro",
        "svelte",
      })
    end,
    dependencies = {
      { "windwp/nvim-ts-autotag" },
    },
  },
}
