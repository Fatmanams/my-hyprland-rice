-- mason.lua: extra tools for Mason to install (debugpy, stylua).
-- Language servers, codelldb (C, C++, Rust) and delve (Go) come from the LazyVim extras, so they are not listed here.

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
