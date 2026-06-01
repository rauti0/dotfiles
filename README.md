# dotfiles

My personal Arch Linux desktop configuration managed with GNU Stow.

https://www.gnu.org/software/stow/

## Stack

- **WM:** i3
- **Bar:** Polybar
- **Launcher:** Rofi
- **Terminal:** Alacritty
- **Compositor:** Picom
- **Display manager:** LightDM
- **Audio:** Pipewire + Wireplumber
- **Shell:** Bash

## Theme system

Colours are defined in `theme/.config/theme/palettes/` as `.env` files. A
`build.sh` script reads the active palette and uses `envsubst` to render
`.tmpl` template files into the final configs for i3, Polybar, Rofi, and
Alacritty. Switching themes is one command:

```bash
theme green   # or: theme neon
```

This symlinks the chosen palette, rebuilds all configs from templates, swaps
the wallpaper if a matching image exists in `~/Pictures/`, and restarts i3.

## Install 

**Requirements:** fresh Arch Linux install with `git` and `stow` available.

```bash
git clone https://github.com/ax93/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash desktop.sh
```

The script installs packages from `packages.txt`, enables services, stows all
configs with conflict backup, and runs the initial theme build. Reboot or
`sudo systemctl start lightdm` when done.
