# Neovim config

A [LazyVim](https://www.lazyvim.org) setup for Python, C and C++, Rust, Go, TypeScript and JavaScript, Lua, and shell scripts.

- **F5** runs the current file in a split at the bottom.
- **Debugging** works for Python, C, C++, Rust, and Go.
- **Maintenance** is covered in [MAINTENANCE.md](MAINTENANCE.md). The checks are in `nvim-tests/` at the top of the repo.

## What you need

- Neovim 0.11.2 or newer, built with LuaJIT. The pinned LazyVim commit requires this.
- git, ripgrep, and fd
- A C compiler (gcc or clang), for Treesitter parsers
- Node.js, for TypeScript and JavaScript
- Python 3, with a `.venv` in each project
- Rust (rustc, cargo, and rust-analyzer), for Rust
- Go, for Go
- CMake, for C and C++ projects that use it

Mason installs language servers and debug adapters for you. Run `:checkhealth` to see anything else that's missing.

## Install

Copy this folder to `~/.config/nvim`. The top-level README has the full steps.

Start `nvim`. The first launch installs plugins, which takes a minute or two. Restart Neovim when it finishes.

## Keys

`Space` is the leader key. Keys marked * come from LazyVim's extras rather than this config.

| Key | What it does |
| --- | --- |
| `F5` | Run the current file in a split at the bottom |
| `<leader>cf` | Format the buffer * |
| `<leader>cv` | Choose a Python virtual environment * |
| `<leader>ch` | Switch between a C/C++ source file and its header * |
| `<leader>cR` | Rust code actions * |
| `<leader>db` | Toggle a breakpoint * |
| `<leader>dc` | Start, or continue, debugging * |
| `<leader>di`, `<leader>dO`, `<leader>do` | Step into, over, or out * |
| `<leader>dt` | Stop debugging * |
| `<leader>du` | Show or hide the debugger panels * |
| `<leader>dr` | Rust files: show debuggables. Other files: toggle the debug REPL * |
| `<leader>dPt`, `<leader>dPc` | Python: debug the test method or class under the cursor * |

## Languages

| Language | F5 runs | Debugger |
| --- | --- | --- |
| Python | the venv picked with `<leader>cv`, else the project's `.venv`, else `python3` | debugpy |
| C | `gcc`, then the program | codelldb |
| C++ | `g++`, then the program | codelldb |
| Rust | `cargo run` in a Cargo project, `rustc` for a single file | codelldb |
| Go | `go run` | delve |
| TypeScript | `npx tsx` | not set up yet |
| JavaScript | `node` | not set up yet |
| Lua | `lua` | not set up yet |
| Shell | `bash` | not set up yet |

Python is checked by pyright and linted by ruff. Python formatting goes through ruff's language server, because LazyVim sets no separate formatter for Python. Lua is formatted with stylua, and shell scripts with shfmt.

## License

Files from the LazyVim starter are Apache 2.0 (see LICENSE). The rest of this folder is MIT, as the top-level README says.
