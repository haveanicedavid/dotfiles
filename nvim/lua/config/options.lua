-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.vscode then
  -- VSCode extension
  vim.opt.clipboard = ""
else
  -- default nvim
  -- vim.opt.exrc = true -- exec local files on load
  vim.opt.conceallevel = 3
  vim.filetype.add({
    extension = {
      mdx = "mdx",
      astro = "astro",
    },
  })
  vim.opt.spelllang = "en_us"
  vim.opt.spell = true
  vim.opt.spelloptions = "camel"
  vim.opt.clipboard = ""
end
