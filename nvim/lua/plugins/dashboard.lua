-- plugins/dashboard.lua
-- The start screen: ASCII header and sections, built with snacks.nvim.
-- To change: edit the header lines or the sections.
-- Docs: https://github.com/folke/snacks.nvim

-- ~/.config/nvim/lua/plugins/dashboard.lua

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,

        preset = {
          header = [[
███████╗ █████╗ ████████╗███╗   ███╗ █████╗ ███╗   ██╗
██╔════╝██╔══██╗╚══██╔══╝████╗ ████║██╔══██╗████╗  ██║
█████╗  ███████║   ██║   ██╔████╔██║███████║██╔██╗ ██║
██╔══╝  ██╔══██║   ██║   ██║╚██╔╝██║██╔══██║██║╚██╗██║
██║     ██║  ██║   ██║   ██║ ╚═╝ ██║██║  ██║██║ ╚████║
╚═╝     ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
]],
        },

        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2 },
          { icon = " ", title = "Projects", section = "projects", indent = 2 },
          { section = "startup" },
        },
      },
    },
  },
}
