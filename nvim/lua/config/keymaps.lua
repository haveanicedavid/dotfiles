-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

-- H / L for selection in non-normal mode
set({ "o", "v" }, "L", "g_", { desc = "Go to end of line", noremap = true })
set({ "o", "v" }, "H", "_", { desc = "Go to start of line", noremap = true })

-- Insert mode
set("i", "<A-BS>", "<C-w>", { desc = "Delete previous word in insert mode" })
set("i", "<C-a>", "<Home>", { desc = "Go to start of line in insert mode" })
set("i", "<C-e>", "<End>", { desc = "Go to end of line in insert mode" })

set("n", "<leader>d", "<leader>bd", { desc = "Close buffer", remap = true })
set({ "n", "v" }, "<leader>j", "J", { desc = "Join lines" })

set("n", "gh", vim.lsp.buf.hover, { desc = "LSP Hover" })
set("n", "gj", "<C-w>j", { desc = "Go to lower window", remap = true })
set("n", "gk", "<C-w>k", { desc = "Go to upper window", remap = true })
set({ "n", "v" }, "<leader>gw", "gw", { desc = "Wrap", remap = true })
set("n", "<leader>cL", "<Cmd>LspRestart<Cr>", { desc = "Restart LSP" })

-- Proprietary keymaps (based on my system vim which makes these silly for
-- anyone else to use)
set("n", "<A-Left>", "<C-b>", { desc = "Go back a page" })
set("n", "<Left>", "<C-w>h", { desc = "Go to left window", remap = true })
set("n", "<Right>", "<C-w>l", { desc = "Go to right window", remap = true })

set({ "n" }, "<leader>;", "q:", { desc = "Commandline-Window History Mode" })

-- TreeSitter incremental/decremental selection
set(
  { "n", "v" },
  "<C-space>",
  "<cmd>lua require('nvim-treesitter.incremental_selection').init_selection()<CR>",
  { desc = "Increment selection", remap = true }
)
set(
  { "n", "v" },
  "<C-BS>",
  "<cmd>lua require('nvim-treesitter.incremental_selection').node_decremental()<CR>",
  { desc = "Decrement selection", remap = true }
)

-- search for lines with the same indentation
local function searchNextSameIndent(direction)
  local line = vim.fn.line(".")
  local indent = vim.fn.matchstr(vim.fn.getline("."), [[\(^\s*\)]])
  local searchPattern

  if direction == "next" then
    searchPattern = "^" .. indent .. [[\%>]] .. line .. "l\\S"
  elseif direction == "prev" then
    searchPattern = "^" .. indent .. [[\%<]] .. line .. "l\\S"
  end

  vim.fn.search(searchPattern, direction == "next" and "e" or "be")
end

-- Go to line at prev / current indentation
set({ "n", "v" }, "J", function()
  searchNextSameIndent("next")
end, { desc = "Next line with same indent" })
set({ "n", "v" }, "K", function()
  searchNextSameIndent("prev")
end, { desc = "Previous line with same indent", remap = true })
