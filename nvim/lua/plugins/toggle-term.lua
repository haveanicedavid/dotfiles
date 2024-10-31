local set = vim.keymap.set
-- local opts = { buffer = 0 }
-- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

set("t", "<C-1>", [[<Cmd>1ToggleTerm<CR>]])
set("t", "<C-2>", [[<Cmd>2ToggleTerm<CR>]])
set("t", "<C-3>", [[<Cmd>3ToggleTerm<CR>]])
set("t", "<C-4>", [[<Cmd>4ToggleTerm<CR>]])
set("t", "<C-5>", [[<Cmd>5ToggleTerm<CR>]])
set("t", "<C-o>", [[<Cmd>ToggleTermToggleAll<CR>]])

set(
  "n",
  "<leader>vj",
  "<Cmd>1ToggleTerm<CR>",
  { desc = "Terminal 1", remap = true }
)
set(
  "n",
  "<leader>vk",
  "<Cmd>2ToggleTerm<CR>",
  { desc = "Terminal 2", remap = true }
)
set(
  "n",
  "<leader>vl",
  "<Cmd>3ToggleTerm<CR>",
  { desc = "Terminal 3", remap = true }
)
set(
  "n",
  "<leader>v;",
  "<Cmd>4ToggleTerm<CR>",
  { desc = "Terminal 4", remap = true }
)
set(
  "n",
  "<leader>v'",
  "<Cmd>5ToggleTerm<CR>",
  { desc = "Terminal 4", remap = true }
)

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {--[[ things you want to change go here]]
    open_mapping = [[<c-;>]],
    shade_terminals = true,
    direction = "float",
    float_opts = {
      border = "curved",
    },
    -- keys = {
    --   {
    --     "<leader>vj",
    --     "<Cmd>1ToggleTerm<CR>",
    --     desc = "Toggle Terminal 1",
    --   },
    --   {
    --     "<leader>vk",
    --     "<Cmd>2ToggleTerm<CR>",
    --     desc = "Toggle Terminal 2",
    --   },
    -- },
  },
}
