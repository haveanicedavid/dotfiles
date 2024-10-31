-- TODO: this seems to be causing errors 7/17/24
if true then
  return {}
end
return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    {
      "chrisgrieser/nvim-scissors",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load(
          "~/.config/nvim/snippets"
        )
      end,
    },
  },
}
