-- https://github.com/mg979/vim-visual-multi
return {
  "mg979/vim-visual-multi",
  -- hack to work in vscode-neovim
  cond = function()
    return (not not vim.g.vscode) or (not vim.g.vscode)
  end,
  keys = {
    {
      mode = { "n", "v" },
      "<C-n>",
      desc = "Start multiple cursors",
    },
  },
}
