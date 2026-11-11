-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local runners = {
  python = "python3 {file}",
  lua = "lua {file}",
  sh = "bash {file}",
  go = "go run {file}",
  javascript = "node {file}",
  c = "gcc {file} -o /tmp/a.out && /tmp/a.out",
  cpp = "g++ {file} -o /tmp/a.out && /tmp/a.out",
  rust = "cargo run",
}
local run_buf

vim.keymap.set("n", "<F5>", function()
  local tmpl = runners[vim.bo.filetype]
  if not tmpl then
    vim.notify("No runner for filetype: " .. vim.bo.filetype, vim.log.levels.WARN)
    return
  end

  vim.cmd("write")
  local file = vim.fn.shellescape(vim.fn.expand("%:p"))
  local cmd = tmpl:gsub("{file}", function()
    return file
  end)

  -- fully delete the previous run output (buffer and window)
  if run_buf and vim.api.nvim_buf_is_valid(run_buf) then
    vim.api.nvim_buf_delete(run_buf, { force = true })
  end

  vim.cmd("botright 12split")
  vim.cmd("terminal " .. cmd)
  run_buf = vim.api.nvim_get_current_buf()
  vim.bo[run_buf].buflisted = false -- keep it out of the tab bar
  vim.cmd("wincmd p") -- jump back to your code
end, { desc = "Run current file" })
