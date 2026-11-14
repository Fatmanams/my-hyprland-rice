-- plugins/mason.lua
-- Tools Mason installs for you: the Python debug adapter and the Lua formatter.
-- Language servers, codelldb (C, C++, Rust), and delve (Go) come from the LazyVim
-- extras, so they are not listed here.
-- To change: edit the list below, then run :Mason to check what installed.
-- Docs: https://github.com/mason-org/mason.nvim
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "debugpy", -- Python debugger, used by nvim-dap-python
        "stylua", -- Lua formatter, reads stylua.toml
      })
    end,
  },
}
