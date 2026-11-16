-- keymaps.lua: custom keymaps. Currently F5 = run the current file (languages are in util/runner.lua).

-- F5: run the current file in a split at the bottom (see util/runner.lua).
vim.keymap.set("n", "<F5>", function()
  require("util.runner").run()
end, { desc = "Run current file" })
