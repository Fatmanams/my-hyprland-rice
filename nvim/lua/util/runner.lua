-- util/runner.lua
-- Runs the file in the current buffer in a terminal split at the bottom.
-- F5 calls M.run(). The binding lives in config/keymaps.lua.
--
-- To add a language, add one entry to `runners`, keyed by filetype (check it
-- with :echo &filetype). The entry receives `ctx` and returns a shell command:
--   ctx.file  full path of the current file, shell-escaped
--   ctx.dir   directory of the current file; commands run from here
--   ctx.out   temporary path for compiled programs, shell-escaped
--
-- Python: see M.find_python below.
-- Docs: https://neovim.io/doc/user/lua-guide.html
-- Terminal buffers: https://neovim.io/doc/user/terminal.html
-- venv-selector (the <leader>cv picker): https://github.com/linux-cultist/venv-selector.nvim
local M = {}

-- The Python that venv-selector (<leader>cv) picked, or nil if none is picked.
-- LazyVim loads venv-selector for Python files, so it is usually available.
local function selected_python()
  local ok, selector = pcall(require, "venv-selector")
  if not ok then
    return nil
  end
  local python = selector.python()
  if python and vim.uv.fs_stat(python) then
    return python
  end
  return nil
end

-- Find the Python interpreter for a directory, in this order:
--   1. the venv picked with <leader>cv, so F5 uses the same Python as the language server
--   2. a .venv or venv folder in this directory or a parent folder
--   3. the venv activated in the shell that started Neovim (VIRTUAL_ENV)
--   4. python3 on PATH
function M.find_python(dir)
  local selected = selected_python()
  if selected then
    return selected
  end

  local venv = vim.fs.find({ ".venv", "venv" }, {
    upward = true,
    path = dir,
    type = "directory",
    limit = 1,
  })[1]
  if venv and vim.uv.fs_stat(venv .. "/bin/python") then
    return venv .. "/bin/python"
  end

  if vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV ~= "" then
    return vim.env.VIRTUAL_ENV .. "/bin/python"
  end

  return "python3"
end

-- Build a program into a temporary file, run it, then delete it.
local function compiled(build)
  return function(ctx)
    return ("%s && %s; rm -f %s"):format(build(ctx), ctx.out, ctx.out)
  end
end

local runners = {
  python = function(ctx)
    return vim.fn.shellescape(M.find_python(ctx.dir)) .. " " .. ctx.file
  end,
  lua = function(ctx)
    return "lua " .. ctx.file
  end,
  sh = function(ctx)
    return "bash " .. ctx.file
  end,
  go = function(ctx)
    return "go run " .. ctx.file
  end,
  javascript = function(ctx)
    return "node " .. ctx.file
  end,
  typescript = function(ctx)
    -- --yes stops npx from asking before it downloads tsx the first time
    return "npx --yes tsx " .. ctx.file
  end,
  c = compiled(function(ctx)
    return ("gcc %s -o %s"):format(ctx.file, ctx.out)
  end),
  cpp = compiled(function(ctx)
    return ("g++ %s -o %s"):format(ctx.file, ctx.out)
  end),
  rust = function(ctx)
    -- Inside a Cargo project, run the project. Otherwise compile the single file.
    local manifest = vim.fs.find("Cargo.toml", { upward = true, path = ctx.dir, limit = 1 })[1]
    if manifest then
      return "cd " .. vim.fn.shellescape(vim.fs.dirname(manifest)) .. " && cargo run"
    end
    return compiled(function(c)
      return ("rustc %s -o %s"):format(c.file, c.out)
    end)(ctx)
  end,
}

-- Returns the shell command for a filetype and file path, or nil and a message.
function M.build_command(filetype, file_path)
  local make = runners[filetype]
  if not make then
    return nil, "No runner for filetype: " .. filetype
  end
  local dir = vim.fs.dirname(file_path)
  local ctx = {
    file = vim.fn.shellescape(file_path),
    dir = dir,
    out = vim.fn.shellescape(vim.fn.tempname()),
  }
  return ("cd %s && %s"):format(vim.fn.shellescape(dir), make(ctx))
end

local run_buf

function M.run()
  local file_path = vim.fn.expand("%:p")
  if file_path == "" then
    vim.notify("Save the buffer before running it", vim.log.levels.WARN)
    return
  end

  local cmd, err = M.build_command(vim.bo.filetype, file_path)
  if not cmd then
    vim.notify(err, vim.log.levels.WARN)
    return
  end

  vim.cmd("write")

  -- Replace the previous run: delete its buffer and window first.
  if run_buf and vim.api.nvim_buf_is_valid(run_buf) then
    vim.api.nvim_buf_delete(run_buf, { force = true })
  end

  vim.cmd("botright 12new")
  vim.fn.jobstart(cmd, { term = true })
  run_buf = vim.api.nvim_get_current_buf()
  vim.bo[run_buf].buflisted = false -- keep it out of the tab bar
  vim.cmd("wincmd p") -- return to your code
end

return M
