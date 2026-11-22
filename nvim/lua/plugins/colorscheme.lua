-- Monokai Pro (Classic filter) palette, used only for syntax colors
local c = {
  pink = "#f92672",
  orange = "#fd971f",
  yellow = "#e6db74",
  green = "#a6e22e",
  blue = "#66d9ef",
  purple = "#ae81ff",
  comment = "#75715e",
  text = "#f8f8f2",
}

-- Vice City neon palette (dashboard only)
local vice = {
  pink = "#ff2e97",
  cyan = "#01cdfe",
  purple = "#b967ff",
  yellow = "#fffb96",
  text = "#f5e9ff",
  dim = "#7a5c99",
}

return {
  {
    "Shatur/neovim-ayu",
    main = "ayu", -- fixes "Lua module not found for config"
    lazy = false,
    priority = 1000,
    opts = {
      mirage = false, -- true = Ayu Mirage variant
      terminal = true,
      overrides = {
        -- comments
        Comment = { fg = c.comment, italic = true },
        ["@comment"] = { fg = c.comment, italic = true },

        -- keywords and operators
        Keyword = { fg = c.pink },
        ["@keyword"] = { fg = c.pink },
        ["@keyword.function"] = { fg = c.pink },
        ["@keyword.return"] = { fg = c.pink },
        ["@operator"] = { fg = c.pink },

        -- strings
        String = { fg = c.yellow },
        ["@string"] = { fg = c.yellow },

        -- functions
        Function = { fg = c.green },
        ["@function"] = { fg = c.green },
        ["@function.call"] = { fg = c.green },
        ["@function.method"] = { fg = c.green },

        -- types
        Type = { fg = c.blue, italic = true },
        ["@type"] = { fg = c.blue, italic = true },
        ["@type.builtin"] = { fg = c.blue, italic = true },

        -- numbers and constants
        Number = { fg = c.purple },
        ["@number"] = { fg = c.purple },
        ["@boolean"] = { fg = c.purple },
        ["@constant"] = { fg = c.purple },
        ["@constant.builtin"] = { fg = c.purple },

        -- parameters and variables
        ["@variable"] = { fg = c.text },
        ["@variable.parameter"] = { fg = c.orange, italic = true },

        -- make LSP semantic tokens follow the same colors
        ["@lsp.type.function"] = { link = "@function" },
        ["@lsp.type.method"] = { link = "@function.method" },
        ["@lsp.type.parameter"] = { link = "@variable.parameter" },
        ["@lsp.type.type"] = { link = "@type" },
        ["@lsp.type.keyword"] = { link = "@keyword" },

        -- Vice City dashboard (snacks.nvim)
        SnacksDashboardHeader = { fg = vice.pink, bold = true }, -- logo (single-color version)
        SnacksDashboardTitle = { fg = vice.cyan, bold = true },  -- section titles
        SnacksDashboardIcon = { fg = vice.purple },              -- menu icons
        SnacksDashboardKey = { fg = vice.yellow, bold = true },  -- g, s, x, l, q
        SnacksDashboardDesc = { fg = vice.text },                -- "Find Text", "Quit"...
        SnacksDashboardFile = { fg = vice.text },                -- recent file names
        SnacksDashboardDir = { fg = vice.dim },                  -- folder paths
        SnacksDashboardSpecial = { fg = vice.cyan },
        SnacksDashboardFooter = { fg = vice.dim },

        -- Vice City logo gradient (only used by the gradient dashboard.lua)
        ViceLogo1 = { fg = "#ff2e97" },
        ViceLogo2 = { fg = "#e53fb5" },
        ViceLogo3 = { fg = "#cf51cb" },
        ViceLogo4 = { fg = "#b967ff" },
        ViceLogo5 = { fg = "#55b0ff" },
        ViceLogo6 = { fg = "#01cdfe" },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu",
    },
  },
}
