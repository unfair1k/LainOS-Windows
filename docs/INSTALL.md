# Installation

## Quick install from CMD

No Git installation is required. Open Command Prompt and run:

    curl.exe -L "https://github.com/unfair1k/LainOS-Windows/archive/refs/heads/main.zip" -o "%TEMP%\LainOS-Windows.zip" && if exist "%TEMP%\LainOS-Windows-main" rmdir /s /q "%TEMP%\LainOS-Windows-main" && tar.exe -xf "%TEMP%\LainOS-Windows.zip" -C "%TEMP%" && call "%TEMP%\LainOS-Windows-main\install.cmd"

This downloads the public repository ZIP, extracts it, and starts the CMD installer. The installer invokes PowerShell internally for configuration and WinGet operations.

## What is installed

The installer asks before installing these WinGet packages:

- GlazeWM — glzr-io.glazewm
- YASB — AmN.yasb
- Fastfetch — Fastfetch-cli.Fastfetch
- JetBrainsMono Nerd Font — DEVCOM.JetBrainsMonoNerdFont

WinGet may request elevation for an individual package. Review prompts before accepting.

Win-Kitty is not installed automatically. This setup uses a specific Windows build; install a compatible Win-Kitty build separately.

## What setup changes

The setup script copies the repository configs to:

| Repository file | Destination |
|---|---|
| configs/glazewm/config.yaml | %USERPROFILE%\.glzr\glazewm\config.yaml |
| configs/kitty/kitty.conf | %USERPROFILE%\.config\kitty\kitty.conf |
| configs/fastfetch/config.jsonc | %USERPROFILE%\.config\fastfetch\config.jsonc |
| configs/yasb/config.yaml | %USERPROFILE%\.config\yasb\config.yaml |
| configs/yasb/styles.css | %USERPROFILE%\.config\yasb\styles.css |
| configs/yasb/yasb_colors.css | %USERPROFILE%\.config\yasb\yasb_colors.css |

Existing configuration files are backed up to Documents\LainOS-Backups\<timestamp> before replacement.

## Wallpapers

The original Kitty wallpaper was named lain-room.jpg. It is not included because the original image was not available in the repository for redistribution.

To use it, copy your own image to:

    %USERPROFILE%\.config\kitty\lain-room.jpg

Or put it in assets\wallpapers\lain-room.jpg before setup. The setup script copies it into Kitty's config folder if no local copy exists.

For the YASB wallpaper gallery, setup prefers:

    %OneDrive%\Imagens\wallpaper\themes\monochrome

when that folder exists. Otherwise it creates and uses:

    %USERPROFILE%\Pictures\Wallpapers

Add your wallpaper files to the selected directory.

## Optional startup shortcuts

Run options.ps1 from the extracted repository folder:
- Option 1 creates GlazeWM and YASB shortcuts in the current user's Startup folder.
- Option 2 removes those shortcuts.

## Restore

Run:

    .\restore.ps1

The script selects the newest backup and asks for confirmation. Restore returns files that existed before setup. It does not uninstall applications or remove newly created config files that had no previous version.

## Optional taskbar hiding

THide 0.1.3 was used as an optional portable taskbar-hiding utility, but it is not bundled or installed by this repository. Verify its source and recovery method before using it.

## Troubleshooting

- WinGet not found: install or update App Installer from Microsoft Store.
- Kitty wallpaper missing: place lain-room.jpg in Kitty's config folder.
- YASB wallpaper gallery empty: add supported images to the selected wallpaper directory.
- GlazeWM shortcut does nothing: confirm GlazeWM is running and check for hotkey conflicts.
- Font looks wrong: confirm JetBrainsMono Nerd Font is installed and restart Kitty.

## Official project links

- GlazeWM: https://github.com/glzr-io/glazewm
- YASB: https://github.com/amnweb/yasb
- YASB installation guide: https://docs.yasb.dev/latest/installation.html
- Kitty: https://github.com/kovidgoyal/kitty
- Fastfetch: https://github.com/fastfetch-cli/fastfetch
- JetBrainsMono Nerd Font: https://www.nerdfonts.com/font-downloads


## Recorded versions and validation

The original desktop used GlazeWM 3.10.1, Win-Kitty 0.48.0, and optional THide 0.1.3. Kitty and THide are not installed by this repository. Exact YASB and Fastfetch versions were not recorded.

The scripts have not yet been validated on a clean Windows installation. Review them before use.


## Optional THide taskbar utility

The original setup used THide 0.1.3 (Windows x64 portable). It is not installed by the main installer because it runs in the background while active.

Official release: https://github.com/amnweb/thide/releases/tag/v0.1.3

From CMD in the extracted repository folder, run:

    call extras\install-thide.cmd

The script downloads the official portable ZIP and extracts it under Downloads. Start it manually with thide.exe. Optional CLI commands include:

    thide.exe start
    thide.exe hide
    thide.exe show
    thide.exe toggle
    thide.exe stop
    thide.exe enable-autostart
    thide.exe disable-autostart

Enabling autostart makes THide launch at sign-in. This is optional and is not done by LainOS setup.
