-- config/keymaps.lua
-- Your keymaps. Loaded on the VeryLazy event, after LazyVim's defaults.
-- To change: add or edit mappings below. Languages for F5 are in util/runner.lua.
-- Docs: https://www.lazyvim.org/keymaps
-- LazyVim's default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- F5: run the current file in a split at the bottom (see util/runner.lua).
vim.keymap.set("n", "<F5>", function()
  require("util.runner").run()
end, { desc = "Run current file" })
