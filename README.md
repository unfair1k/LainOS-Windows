# LainOS for Windows

A dark, minimal Windows desktop rice inspired by Serial Experiments Lain and the idea of **Navi**: a navy-black interface, cyan accents, translucent surfaces, a tiling window manager, a custom top bar, and a clean terminal.

This repository contains configuration files from the author's Windows setup. It is a personal configuration, not a one-click installer.

## Design

- **Palette:** deep navy `#0b0e17`, pale blue text `#c8d5f0`, cyan accent `#00e5ff`
- **Window manager:** GlazeWM
- **Status bar:** YASB
- **Terminal:** Win-Kitty
- **System information:** Fastfetch
- **Taskbar:** THide (optional)

## Layout

```text
configs/
  fastfetch/config.jsonc
  glazewm/config.yaml
  kitty/kitty.conf
  yasb/config.yaml
  yasb/styles.css
  yasb/yasb_colors.css
docs/
  INSTALL.md
  KEYBINDINGS.md
assets/
  wallpapers/README.md
```

## Before installing

1. Back up your existing configuration folders.
2. Install the applications listed in [the installation guide](docs/INSTALL.md).
3. Read the notes about machine-specific paths. Do not copy the author's Windows paths blindly.
4. Apply one application at a time and verify it launches before moving on.

This repository does **not** include Windows executables, THide binaries, fonts, or wallpaper images. Add only wallpaper images you created or have permission to redistribute.

- [Installation guide](docs/INSTALL.md)
- [GlazeWM and Kitty keyboard shortcuts](docs/KEYBINDINGS.md)

## Machine-specific settings

- The YASB wallpaper widget contains the author's former wallpaper-folder path. Change it to your own folder before enabling that widget.
- Kitty's background image path points to the author's local `lain-room.jpg`. Place your own image at that path or update/remove the `background_image*` settings.
- Fastfetch's built-in `LainOS` logo may depend on the installed Fastfetch logo set/version.
- THide is optional. Hiding the Windows taskbar can make recovery and troubleshooting less convenient; keep a way to restore it.

## Credits

This rice combines configuration for third-party projects. Their software and assets remain the property of their respective authors. See [INSTALL.md](docs/INSTALL.md) for upstream links.