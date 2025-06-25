-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = "prisma",
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Auto-switch colorscheme based on system theme
if not vim.g.vscode then
  -- Function to detect and apply system theme
  local function apply_system_theme()
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
    if handle then
      local result = handle:read("*a")
      handle:close()
      local system_theme = result:match("Dark") and "dark" or "light"
      local new_colorscheme = system_theme == "light" and "catppuccin-frappe" or "catppuccin-macchiato"
      
      -- Only change if it's different from current colorscheme
      if vim.g.colors_name ~= new_colorscheme then
        vim.cmd.colorscheme(new_colorscheme)
      end
    end
  end

  -- Check theme when gaining focus (useful for detecting system theme changes)
  vim.api.nvim_create_autocmd({ "FocusGained", "VimEnter" }, {
    callback = apply_system_theme,
    desc = "Auto-switch colorscheme based on system theme",
  })
end
