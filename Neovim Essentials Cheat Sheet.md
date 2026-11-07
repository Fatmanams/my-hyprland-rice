# Neovim Essentials Cheat Sheet

Just enough to write, run, and debug. Arrow keys for movement.

## 1. How to open a terminal

- **Windows:** press the Windows key, type `Terminal` (or `PowerShell`), press Enter. Alternative: `Win + R`, type `cmd`, press Enter.
- **Linux:** `Ctrl + Alt + T` on most desktops. Otherwise open your app launcher and search for "Terminal" (on a tiling setup, use whatever key you bound to your terminal).
- **macOS:** `Cmd + Space`, type `Terminal`, press Enter.
- **Inside nvim:** type `:term` and press Enter. To get back to normal mode, press `Ctrl-\` then `Ctrl-n`. Type `exit` to close it.

## 2. Start nvim

In the terminal, type this and press Enter. It opens the file, or creates it if it doesn't exist yet:

```
nvim hello.py
```

If you get "command not found" (or "not recognized" on Windows), nvim isn't installed or isn't on your PATH.

## 3. The essentials

| Keys | What it does |
| --- | --- |
| `i` | Start typing (insert mode) |
| `Esc` | Stop typing (back to normal mode) |
| Arrow keys | Move the cursor |
| `:w` + Enter | Save |
| `:q` + Enter | Quit |
| `:wq` + Enter | Save and quit |
| `:q!` + Enter | Quit without saving |
| `dd` | Delete the current line |
| `u` | Undo |
| `yy` then `p` | Copy the current line, then paste it below |
| `:!python %` + Enter | Run the current file (`%` means "this file") |

Commands starting with `:` only work from normal mode, so press `Esc` first.

## 4. Run commands by language

Type these from normal mode, then press Enter.

| Language | Command |
| --- | --- |
| Python | `:!python %` (on Windows you may need `:!py %`) |
| C | `:!gcc % -o out && ./out` (on Windows: `&& out.exe`) |
| C++ | `:!g++ % -o out && ./out` (on Windows: `&& out.exe`) |
| Rust (in a cargo project) | `:!cargo run` |
| Lua | `:!lua %` |

## 5. Debugging

- **Start with print statements.** Run the file, read the output, fix, repeat.
- **Later, for step-through debugging of C/C++:** compile with `-g`, then run `:packadd termdebug` followed by `:Termdebug ./out`. This gives you gdb inside nvim.

## 6. The whole workflow

1. `nvim hello.py` to open the file
2. `i` and type your code
3. `Esc` to stop typing
4. `:w` to save
5. `:!python %` to run it
6. Fix, save, run again. When done, `:wq`

## 7. If you get stuck

Press `Esc` two or three times to get back to a known state, then type `:q!` and Enter to leave without saving. You can always reopen the file.

## 8. Add these later, one at a time

- `/text` then `n`: search and jump to the next match
- `gg` and `G`: top and bottom of the file
- `w` and `b`: move by word
- `ciw`: change the word under the cursor
- `h j k l`: the home-row version of the arrow keys
- `nvim +Tutor`: a 30-minute built-in tutorial, the best way to make it stick
