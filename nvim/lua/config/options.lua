-- options.lua: editor options and LazyVim settings (Python LSP choice, disabled providers).
-- Loaded before lazy.nvim starts, so the extras can read the vim.g values below.

vim.g.mapleader = " " -- must be set before lazy.setup
vim.opt.smoothscroll = true

-- Python: pyright is the language server; ruff reports lint problems alongside it.
-- Set vim.g.lazyvim_python_lsp = "basedpyright" for the stricter alternative.
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

-- Providers Neovim would otherwise check for. Nothing in this config uses them.
-- Python stays on, because pynvim is installed.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
