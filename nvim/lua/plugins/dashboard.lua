-- dashboard.lua: start screen (snacks.nvim): gradient ASCII header plus keys, recent files and projects.

local logo = {
  "███████╗ █████╗ ████████╗███╗   ███╗ █████╗ ███╗   ██╗",
  "██╔════╝██╔══██╗╚══██╔══╝████╗ ████║██╔══██╗████╗  ██║",
  "█████╗  ███████║   ██║   ██╔████╔██║███████║██╔██╗ ██║",
  "██╔══╝  ██╔══██║   ██║   ██║╚██╔╝██║██╔══██║██║╚██╗██║",
  "██║     ██║  ██║   ██║   ██║ ╚═╝ ██║██║  ██║██║ ╚████║",
  "╚═╝     ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝",
}

-- one section per logo line, each with its own highlight group (ViceLogo1..6)
local sections = {}
for i, line in ipairs(logo) do
  sections[#sections + 1] = {
    align = "center",
    padding = (i == #logo) and 1 or 0,
    text = { { line, hl = "ViceLogo" .. i } },
  }
end

vim.list_extend(sections, {
  { icon = " ", title = "Keymaps", section = "keys", indent = 2 },
  { icon = " ", title = "Recent Files", section = "recent_files", indent = 2 },
  { icon = " ", title = "Projects", section = "projects", indent = 2 },
  { section = "startup" },
})

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        sections = sections,
      },
    },
  },
}
