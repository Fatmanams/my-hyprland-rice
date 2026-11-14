# Maintaining this Neovim config

This is a LazyVim setup. Most changes go in `lua/config/` and `lua/plugins/`. The header of each file says what it does.

## Monthly routine

1. Run `:Lazy update` in Neovim. It updates lazy.nvim, LazyVim, and every plugin.
2. Run `nvim-tests/run-checks.sh` from the repo. All three checks should pass.
3. Work through the parts of [CHECKLIST.md](../nvim-tests/CHECKLIST.md) for the languages you use.
4. If everything passes, commit `lazy-lock.json`. It records the exact commit of every plugin.
5. If something breaks, run `:Lazy restore`. That puts every plugin back at the commit in `lazy-lock.json`. Then fix the problem, or wait for an upstream fix.

## When LazyVim releases a new version

- Read the release notes first: https://github.com/LazyVim/LazyVim/releases
- Check that `lua/config/options.lua` still selects the Python language server you want. Extras sometimes change their defaults.
- Check the minimum Neovim version in the release notes. This config needs 0.11.2 or newer right now.

## Adding a language

1. Turn on its extra with `:LazyExtras`. That command edits `lazyvim.json` for you.
2. Install its tools with `:Mason`.
3. Add an entry to `runners` in `lua/util/runner.lua`. The key is the filetype, which `:echo &filetype` shows.
4. Add a sample to `nvim-tests/samples/` and a row to the checklist.
5. Press F5 on the sample.

## C and C++: compile_commands.json

clangd reads `compile_commands.json` to find your include paths and compiler flags. Pick the option that matches your project.

- **CMake:** `cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON`. If clangd doesn't find the file, link it into the project root with `ln -sf build/compile_commands.json .`, then run `:lsp restart`.
- **Make:** install Bear, then run `bear -- make`. Bear records the compiler commands while the build runs.
- **Single files:** list one flag per line in `compile_flags.txt`, for example `-std=c++17`.

Reference: https://clangd.llvm.org/installation

## Debugging

| Language | Debugger | Where it comes from |
| --- | --- | --- |
| Python | debugpy | `lua/plugins/mason.lua` |
| C, C++ | codelldb | the clangd extra |
| Rust | codelldb | the Rust extra, through rustaceanvim |
| Go | delve | the Go extra |

TypeScript, JavaScript, Lua, and shell don't have a debugger set up. Add one when you need it.

## Python: which interpreter F5 uses

F5 uses the first of these that exists:

1. The venv picked with `<leader>cv`. This is the same interpreter the language server uses.
2. A `.venv` or `venv` folder in the file's folder or a parent folder.
3. The venv activated in the shell that started Neovim (`VIRTUAL_ENV`).
4. `python3` on your PATH.

## Checks

- `nvim-tests/run-checks.sh`: syntax, runner, and startup checks. Run it after every update.
- `:checkhealth`: missing tools and provider problems. The Node, Perl, and Ruby providers are turned off on purpose.
- `:checkhealth vim.lsp`: which language servers are attached (see "Active Clients").
- `:Mason`: installed tools, and install errors.
- `:verbose nmap <F5>`: what F5 runs, and where it was set.
- `:messages`: recent errors.
- `:Lazy profile`: which plugins slow down startup.

## Known gaps

- shfmt and shellcheck aren't installed by this config, even though shell formatting uses shfmt. Add them to `lua/plugins/mason.lua` if you want them.
- The F5 output stays in its split until you press F5 again.
- In Rust files, `<leader>dr` opens debuggables instead of the debug REPL.

## Files

| File | What it does |
| --- | --- |
| `init.lua` | Entry point |
| `lazyvim.json` | Enabled LazyVim extras (edit with `:LazyExtras`) |
| `lazy-lock.json` | Exact commit of each plugin (commit it, don't edit it) |
| `stylua.toml` | Lua formatting rules |
| `lua/config/lazy.lua` | lazy.nvim bootstrap (stock, with luarocks turned off) |
| `lua/config/options.lua` | Leader key, smooth scrolling, Python language server, unused providers |
| `lua/config/keymaps.lua` | Your keymaps, including F5 |
| `lua/config/autocmds.lua` | Your autocommands (none yet) |
| `lua/util/runner.lua` | What F5 runs for each language, and which Python |
| `lua/plugins/mason.lua` | Tools Mason installs automatically |
| `lua/plugins/dashboard.lua` | Start screen |
| `lua/plugins/transparent.lua` | Transparent background |

The checks and samples live in `nvim-tests/` at the top of the repo. That folder isn't copied to `~/.config/nvim`.

## Links

- LazyVim docs: https://www.lazyvim.org
- LazyVim extras: https://www.lazyvim.org/extras
- lazy.nvim: https://lazy.folke.io
- Neovim docs: https://neovim.io/doc/
- Neovim Lua guide: https://neovim.io/doc/user/lua-guide.html
- Mason: https://github.com/mason-org/mason.nvim
- nvim-dap: https://github.com/mfussenegger/nvim-dap
- nvim-dap-python: https://github.com/mfussenegger/nvim-dap-python
- nvim-dap-go: https://github.com/leoluz/nvim-dap-go
- rustaceanvim: https://github.com/mrcjkb/rustaceanvim
- clangd: https://clangd.llvm.org
- CMAKE_EXPORT_COMPILE_COMMANDS: https://cmake.org/cmake/help/latest/variable/CMAKE_EXPORT_COMPILE_COMMANDS.html
- Bear: https://github.com/rizsotto/Bear
- ruff: https://docs.astral.sh/ruff/
- pyright: https://github.com/microsoft/pyright
- conform.nvim: https://github.com/stevearc/conform.nvim
- StyLua: https://github.com/JohnnyMorganz/StyLua
- tsx: https://tsx.is
- venv-selector: https://github.com/linux-cultist/venv-selector.nvim
