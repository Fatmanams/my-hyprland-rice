# my-hyprland-rice

My personal Linux desktop config (dotfiles) for Fedora: Hyprland, Waybar, Kitty, Neovim and more.

## What's inside

| Folder | What it is |
| --- | --- |
| `hypr/` | Hyprland config (`hyprland.lua`) and lock screen (`hyprlock.conf`) |
| `mango/` | Mango config, an alternative window manager |
| `waybar/` | Status bar config and the animated cat/skull scripts |
| `kitty/` | Terminal config and theme |
| `nvim/` | Neovim config (LazyVim based) |
| `fuzzel/`, `rofi/` | App launchers |
| `fastfetch/` | System info display |
| `gtk-3.0/`, `gtk-4.0/` | GTK settings |
| `wallpaper/` | Wallpapers |

## Programs used

| Program | Purpose | Keybind |
| --- | --- | --- |
| Hyprland or Mango | Window manager | |
| Kitty | Terminal | `Super + Q` |
| Fuzzel or Rofi | App launcher | `Alt + Space` |
| Waybar | Status bar | |
| Neovim | Editor | |
| Fastfetch | System info | |
| swaybg | Wallpaper | |
| pamixer | Volume control | `Alt + [` down, `Alt + ]` up |
| LibreWolf | Browser | |

Kitty is set up to use the **fish** shell, so install it first.

## Install

```bash
# 1. Get the repo
git clone git@github.com:YOUR_USERNAME/my-hyprland-rice.git
cd my-hyprland-rice

# 2. Back up your current config (optional but smart)
cp -r ~/.config ~/.config.backup

# 3. Copy the folders you want into ~/.config
cp -r hypr waybar kitty nvim fuzzel rofi fastfetch gtk-3.0 gtk-4.0 mango ~/.config/

# 4. Copy the wallpapers (hyprland.lua expects them in ~/.config/wallpaper)
cp -r wallpaper ~/.config/
```

You can copy only the folders you care about. They don't depend on each other.

> **Important:** change the monitor resolution and refresh rate in the Hyprland/Mango config to match your own monitor.

## Waybar cat script (optional)

To get the running cat in Waybar:

1. Copy the cat font from `waybar/scripts/fonts/` to `~/.local/share/fonts/`
2. Run `fc-cache -f -v`
3. Restart Waybar

See `waybar/scripts/README.md` for how it works.

## Credits

- Waybar cat/skull scripts: waycat (see `waybar/scripts/README.md`), inspired by [gnome-runcat](https://github.com/win0err/gnome-runcat)
- Neovim config: [LazyVim](https://github.com/LazyVim/LazyVim) starter (Apache 2.0, see `nvim/LICENSE`)

## License

The configs in this repo are under the [MIT License](LICENSE). Third-party files (the LazyVim starter, the waycat scripts and fonts, and the wallpapers) belong to their own authors and are not covered by it.
