-- obsidian.lua: Obsidian vault integration (obsidian.nvim) for the Rice Roadmap notes.

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- latest release instead of latest commit
  ft = "markdown",
  opts = {
    legacy_commands = false, -- removes the deprecation warning
    workspaces = {
      {
        name = "rice-roadmap",
        path = "/home/fatman/obsidian.nvim/Rice Roadmap", -- the folder that holds the notes
      },
    },
  },
}
