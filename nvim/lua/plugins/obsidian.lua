return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- latest release instead of latest commit
  ft = "markdown",
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal", -- your vault root (where .obsidian/ lives)
      },
    },
  },
}
