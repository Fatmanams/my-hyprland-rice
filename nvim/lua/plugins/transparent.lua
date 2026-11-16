-- transparent.lua: transparent editor background so the terminal shows through.
-- To turn it off, delete this file and restart.

return {
  {
    "xiyaowong/transparent.nvim",
    priority = 1000,
    config = function()
      require("transparent").setup({})
      vim.cmd("TransparentEnable")
    end,
  },
}
