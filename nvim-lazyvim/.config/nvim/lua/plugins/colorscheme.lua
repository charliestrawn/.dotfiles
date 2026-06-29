return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = true,
      style = "moon",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  { "maxmx03/solarized.nvim", lazy = true },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        if vim.o.background == "light" then
          -- Replace with your preferred light theme
          vim.cmd("colorscheme solarized")
        else
          -- Replace with your preferred dark theme
          vim.cmd("colorscheme tokyonight-moon")
        end
      end,
    },
  },
}
