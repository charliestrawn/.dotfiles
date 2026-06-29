return {
  "epwalsh/obsidian.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "obsidian_vault",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian_vault",
      },
    },
    daily_notes = {
      folder = "dailynotes",
    },
  },
}
