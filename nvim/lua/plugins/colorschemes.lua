return {
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
  },
  {
    "oxfist/night-owl.nvim",
    name = "night-owl",
    lazy = false,
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = function()
      -- Function to detect system theme on macOS
      local function get_system_theme()
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        if handle then
          local result = handle:read("*a")
          handle:close()
          -- If the command returns "Dark", system is in dark mode
          -- If it returns nothing/errors, system is in light mode
          return result:match("Dark") and "dark" or "light"
        end
        return "dark" -- fallback to dark if detection fails
      end

      -- Set colorscheme based on system theme
      local system_theme = get_system_theme()
      local colorscheme = system_theme == "light" and "catppuccin-frappe" or "catppuccin-macchiato"
      
      return {
        colorscheme = colorscheme,
      }
    end,
  },
}
