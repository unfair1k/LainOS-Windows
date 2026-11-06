# Installation

These steps describe the components used by this rice. Install each project from its official source and check its own documentation for current Windows requirements.

## 1. Install the applications

- **GlazeWM:** https://github.com/glzr-io/glazewm
- **YASB:** https://github.com/amnweb/yasb
- **Kitty:** https://github.com/kovidgoyal/kitty (this setup was used with a Windows build)
- **Fastfetch:** https://github.com/fastfetch-cli/fastfetch
- **JetBrainsMono Nerd Font:** https://www.nerdfonts.com/font-downloads
- **THide (optional):** use the original project/release source you have verified; do not download repacks from unofficial sites.

The saved YASB config includes widgets for audio visualization, media, system tray, notifications, wallpapers, and control center. If a widget is unavailable in your installed YASB version, consult the YASB wiki and disable or replace that widget.

## 2. Back up existing configurations

Before replacing anything, copy your current folders somewhere safe:

- `%USERPROFILE%\.glzr\glazewm\`
- `%USERPROFILE%\.config\kitty\`
- `%USERPROFILE%\.config\fastfetch\`
- YASB's configuration directory (open YASB settings or its tray menu to locate it)

## 3. Copy the configuration files

| Repository file | Destination |
|---|---|
| `configs/glazewm/config.yaml` | `%USERPROFILE%\.glzr\glazewm\config.yaml` |
| `configs/kitty/kitty.conf` | `%USERPROFILE%\.config\kitty\kitty.conf` |
| `configs/fastfetch/config.jsonc` | `%USERPROFILE%\.config\fastfetch\config.jsonc` |
| `configs/yasb/config.yaml` | YASB config directory, usually `config.yaml` |
| `configs/yasb/styles.css` | YASB config directory, usually `styles.css` |
| `configs/yasb/yasb_colors.css` | YASB config directory, usually `yasb_colors.css` |

Back up existing files before replacing them.

## 4. Fix local paths

The saved YASB wallpaper widget and Kitty wallpaper reference paths belong to the original author's PC. Change them to paths that exist on your computer.

- In YASB `config.yaml`, update the `wallpapers.options.image_path` value.
- In Kitty `kitty.conf`, update or remove `background_image`, `background_image_layout`, and `background_image_linear`.

The repository does not redistribute the author's wallpaper image. Add a wallpaper you are allowed to use in your own folder.

## 5. Start and verify

1. Start GlazeWM and verify that windows tile and keybindings work.
2. Start YASB and confirm the top bar appears.
3. Open Kitty and check the font, colors, wallpaper path, and opacity.
4. Run `fastfetch` in Kitty.
5. After everything works, configure apps to launch at sign-in using Windows Startup Apps or the Startup folder.

## 6. Optional: hide the Windows taskbar

THide was used as an optional taskbar-hiding utility. It is not included here. Verify the original download source, read its instructions, and test how to restore the taskbar before enabling automatic hiding. Keep a recovery method available.

## Troubleshooting

- **Kitty wallpaper missing:** update the image path or remove the background image directives.
- **YASB wallpaper gallery empty:** update the folder path and confirm it contains supported images.
- **YASB widget error:** check the widget name/options against the current YASB documentation.
- **GlazeWM shortcut does nothing:** confirm GlazeWM is running and check whether another application captured the same key.
- **Font looks wrong:** install JetBrainsMono Nerd Font and restart Kitty.