# obsidian.nvim Cheat Sheet

Quick reference for the Rice Roadmap vault in LazyVim. Checked against the plugin's public docs on 16 Nov 2026.

## The one rule

Everything starts with `:Obsidian`. Press Enter on its own to open a menu of every available action. Press Tab after it to complete a subcommand. The menu is context-sensitive: some actions only appear inside a note or in visual mode.

## Notes and navigation

| Command | What it does |
| --- | --- |
| `:Obsidian new [title]` | Create a new note |
| `:Obsidian quick_switch` | Fuzzy-find a note by name and open it |
| `:Obsidian search [query]` | Search the whole vault (needs ripgrep) |
| `:Obsidian today [offset]` | Open or create today's daily note. `today -1` is yesterday |
| `:Obsidian unique_note [title]` | New note with a timestamp-based ID |
| `:Obsidian follow_link [vsplit/hsplit]` | Follow the link under the cursor, optionally in a split |
| `:Obsidian backlinks` | List the notes that link to the current one |
| `:Obsidian links` | List every link in the current buffer |
| `:Obsidian tags [tag]` | List notes that use the given tags |
| `:Obsidian workspace [name]` | Switch workspace |
| `:Obsidian open [query]` | Open the note in the Obsidian desktop app |

## Editing

| Command | What it does |
| --- | --- |
| `:Obsidian template [name]` | Insert a template from the templates folder |
| `:Obsidian toggle_checkbox` | Cycle the checkbox state |
| `:Obsidian paste_img [name]` | Paste an image from the clipboard (needs wl-clipboard or xclip) |
| `:Obsidian rename [name]` | Rename the note and update links. Run `:wa` afterwards |

## Visual mode (select text first)

| Command | What it does |
| --- | --- |
| `:Obsidian link [query]` | Turn the selection into a link to an existing note |
| `:Obsidian link_new [title]` | Create a new note from the selection and link to it |
| `:Obsidian extract_note [title]` | Move the selection into a new note and link to it |

## Typing shortcuts

| Keys | What happens |
| --- | --- |
| `[[` | Completion for note links |
| `#` | Completion for tags |
| `gf` on a link | Follows it. Taken from older docs, so test it |
| `<CR>` smart action | Follows a link, opens a tag picker, or toggles a checkbox. Only works if you map it yourself |

## Old command names to new

| Old (deprecated) | New |
| --- | --- |
| `:ObsidianNew` | `:Obsidian new` |
| `:ObsidianQuickSwitch` | `:Obsidian quick_switch` |
| `:ObsidianSearch` | `:Obsidian search` |
| `:ObsidianToday` | `:Obsidian today` |
| `:ObsidianBacklinks` | `:Obsidian backlinks` |
| `:ObsidianFollowLink` | `:Obsidian follow_link` |
| `:ObsidianLinks` | `:Obsidian links` |
| `:ObsidianTags` | `:Obsidian tags` |
| `:ObsidianTemplate` | `:Obsidian template` |
| `:ObsidianWorkspace` | `:Obsidian workspace` |
| `:ObsidianPasteImg` | `:Obsidian paste_img` |
| `:ObsidianExtractNote` | `:Obsidian extract_note` |

The old names are removed in obsidian.nvim 4.0. Your config already has `legacy_commands = false`, so only the new names work.

## Your setup

| Item | Value |
| --- | --- |
| Plugin spec | `~/.config/nvim/lua/plugins/obsidian.lua` |
| Workspace name | `rice-roadmap` |
| Vault path | `/home/fatman/obsidian.nvim/Rice Roadmap` |
| Lint config | `.markdownlint.json` in the vault folder (turns off MD013, MD022, MD032, MD058, MD060) |
| Backup of old config | `~/.config/nvim.bak` |

## Troubleshooting

| Symptom | Fix |
| --- | --- |
| "Please specify a valid workspace" | The workspace `path` doesn't exist. Fix it in `obsidian.lua` |
| Search or completion does nothing | Install ripgrep: `sudo dnf install ripgrep` |
| Picker doesn't open | Make sure your picker plugin (telescope) is installed. If needed, set `picker = { name = "telescope" }` in the plugin opts |
| Deprecation warning about legacy commands | Set `legacy_commands = false` and use the new command names |
| Orange markdown lint warnings | Check `.markdownlint.json` is in the vault folder, then reopen the note |
| Image paste fails | Install `wl-clipboard` (Wayland) or `xclip` (X11) |
| Anything else | Run `:checkhealth obsidian` and `:Obsidian check` |

## Things to double-check

- New notes may get timestamp-style filenames instead of readable titles like `01 Stack`. If so, the `note_id_func` option controls the naming.
- `rename` and `template` are moving to code actions in plugin version 3.17.0, so those two commands may change.
