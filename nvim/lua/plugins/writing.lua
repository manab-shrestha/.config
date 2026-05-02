return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {},
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/Obsidian",
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      note_frontmatter_func = function(note)
        return {
          id = note.id,
          aliases = note.aliases,
          tags = note.tags,
        }
      end,
    },
  },
}

