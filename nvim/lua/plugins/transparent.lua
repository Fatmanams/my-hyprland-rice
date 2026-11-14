-- plugins/transparent.lua
-- Makes the editor background transparent, so the terminal background shows through.
-- To change: edit the options below. To turn it off, delete this file and restart.
-- Docs: https://github.com/xiyaowong/transparent.nvim

return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false, -- load on startup
    priority = 1000,
    config = function()
      require("transparent").setup({
        -- Optional: add groups you don't want to be transparent
        extra_groups = {},
        exclude_groups = {},
      })

      -- Enable transparency automatically
      vim.cmd("TransparentEnable")
    end,
  },
}
