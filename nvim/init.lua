-- init.lua
-- Entry point. Neovim runs this file first, then loads config/lazy.lua.
-- To change: edit config/ or plugins/ instead. This file rarely needs changes.
-- Docs: https://www.lazyvim.org/installation

require("config.lazy")
-- Everything else belongs in files LazyVim loads for you, in the right order:
--   lua/config/options.lua   (after LazyVim's default options)
--   lua/config/keymaps.lua   (after LazyVim's default keymaps, on VeryLazy)
--   lua/config/autocmds.lua  (autocmds and user commands, on VeryLazy)
--   lua/plugins/*.lua        (plugin specs, merged with LazyVim's)
