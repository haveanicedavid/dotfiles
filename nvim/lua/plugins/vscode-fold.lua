if true then
  return {}
end
return {
  {
    "LazyVim/LazyVim",
    optional = true,
    init = function()
      if vim.g.vscode then
        -- Folding commands
        vim.keymap.set("n", "zc", function()
          vim.fn.VSCodeNotify("editor.fold")
        end)
        vim.keymap.set("n", "zC", function()
          vim.fn.VSCodeNotify("editor.foldAll")
        end)
        vim.keymap.set("n", "zo", function()
          vim.fn.VSCodeNotify("editor.unfold")
        end)
        vim.keymap.set("n", "zO", function()
          vim.fn.VSCodeNotify("editor.unfoldAll")
        end)

        vim.keymap.set("n", "k", "gk", { expr = true, remap = true })
        vim.keymap.set("n", "j", "gj", { expr = true, remap = true })
      end
    end,
  },
}
