# dotfiles

My personal Arch Linux desktop configuration managed with [Ansible](https://www.ansible.com/).


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
theme <THEME> # example: theme green
```

This symlinks the chosen palette, rebuilds all configs from templates, swaps
the wallpaper if a matching image exists in `~/Pictures/`, and restarts i3.

## Install 

**Requirements:** fresh Arch Linux install with `git` and `ansible` available.

```bash
git clone https://github.com/rauti0/dotfiles.git ~/dotfiles

cd ~/dotfiles

ansible-playbook playbook.yml --ask-become-pass
```

This installs the packages from the `packages` role and symlinks all configs
into place. Then build the theme and enable the display manager:

```bash
~/.config/theme/build.sh
sudo systemctl enable --now lightdm
```

## Structure

```
dotfiles/
├── ansible/     playbook and roles (packages, dotfiles)
├── config/      configs linked into ~/.config/
├── home/        dotfiles linked into ~
├── system/      root-owned configs (e.g. LightDM → /etc)
└── README.md
```
