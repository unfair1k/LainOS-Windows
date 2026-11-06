# LainOS for Windows

A dark, minimal Windows desktop rice inspired by Serial Experiments Lain and the idea of **Navi**: navy-black surfaces, cyan accents, translucent YASB styling, GlazeWM tiling, Kitty, and a compact Fastfetch layout.

This repository contains the configuration files and setup scripts used by the original LainOS Windows desktop. It includes a guided installer, keyboard shortcut reference, optional startup controls, and configuration backups.

## Install from CMD (no Git required)

Open **Command Prompt (CMD)** and paste this one line:

    curl.exe -L "https://github.com/unfair1k/LainOS-Windows/archive/refs/heads/main.zip" -o "%TEMP%\LainOS-Windows.zip" && if exist "%TEMP%\LainOS-Windows-main" rmdir /s /q "%TEMP%\LainOS-Windows-main" && tar.exe -xf "%TEMP%\LainOS-Windows.zip" -C "%TEMP%" && call "%TEMP%\LainOS-Windows-main\install.cmd"

The ZIP is downloaded from this public repository, extracted into your temporary folder, and the CMD installer starts. No Git installation or manual file editing is required. The installer uses PowerShell internally to safely copy configuration files and run WinGet; the user-facing launch is through CMD.

The installer asks before installing:
- GlazeWM (glzr-io.glazewm)
- YASB (AmN.yasb)
- Fastfetch (Fastfetch-cli.Fastfetch)
- JetBrainsMono Nerd Font (DEVCOM.JetBrainsMonoNerdFont)

Review the prompts before accepting. WinGet may request elevation for individual packages. At the end, the CMD installer also offers an optional download of THide 0.1.3; it does not enable THide autostart.

## What is included

- GlazeWM configuration with 9 workspaces, tiling, window navigation, movement, resizing, and keyboard shortcuts.
- YASB configuration with a translucent dark bar, workspaces, taskbar, clock, audio, media, system tray, wallpaper gallery, and system widgets.
- YASB CSS and the LainOS cyan/navy palette.
- Win-Kitty configuration with transparency, JetBrainsMono Nerd Font, tabs, and keyboard shortcuts.
- Fastfetch configuration with the LainOS logo and the Navi OS label.
- Backup, restore, and optional startup shortcut scripts.
- English installation, security, and keyboard shortcut documentation.

## Design palette

- Background: #0b0e17
- Foreground: #c8d5f0
- Cyan accent: #00e5ff
- Secondary navy: #101b2b

## Repository layout

    assets/wallpapers/       Wallpaper instructions
    configs/                 GlazeWM, YASB, Kitty, Fastfetch
    docs/                    Install, security, keyboard shortcuts
    install.cmd              CMD entry point
    install.ps1              WinGet installer
    setup.ps1                Backup and apply configuration
    restore.ps1              Restore previous configuration
    options.ps1              Enable/disable startup shortcuts

## Wallpapers

The original Kitty image was named lain-room.jpg and was stored at:

    %USERPROFILE%\.config\kitty\lain-room.jpg

That original image was not present in the repository or available for redistribution, so it is not included. To use it, copy your own licensed lain-room.jpg into that folder, or place it at assets\wallpapers\lain-room.jpg before running setup.

For the YASB wallpaper gallery, the installer prefers the original OneDrive folder if it exists:

    %OneDrive%\Imagens\wallpaper\themes\monochrome

Otherwise it uses:

    %USERPROFILE%\Pictures\Wallpapers

Add your wallpaper images to the selected folder. The YASB config is updated automatically to use that path.

## Optional startup shortcuts

After installation, run options.ps1 from the extracted repository folder:
- Option 1 creates GlazeWM and YASB shortcuts in the Windows Startup folder.
- Option 2 removes those shortcuts.

Startup is optional. GlazeWM and YASB are resident desktop tools while running; disable their startup shortcuts if you do not want them to launch automatically.


## Optional THide taskbar utility

The original setup used THide 0.1.3 (Windows x64 portable) to hide the Windows taskbar. It is intentionally separate from the main installer because it runs in the background when started.

Official project and release:
- https://github.com/amnweb/thide
- https://github.com/amnweb/thide/releases/tag/v0.1.3

After extracting the repository, run this from CMD if you want the same optional utility:

    call extras\install-thide.cmd

Then run thide.exe from the extracted Downloads folder. Its CLI supports start, hide, show, toggle, stop, enable-autostart, and disable-autostart. Autostart is optional; do not enable it unless you want THide to run after sign-in.

## Other scripts

Run these from PowerShell in the repository folder:

    .\setup.ps1
    .\restore.ps1
    .\options.ps1

Backups are stored in Documents\LainOS-Backups. Restore returns previous configuration files; it does not uninstall applications.


## Original setup versions

Recorded versions from the original desktop:
- GlazeWM 3.10.1
- Win-Kitty 0.48.0 (installed separately; not distributed here)
- THide 0.1.3 (optional portable utility; not distributed or installed here)
- JetBrainsMono Nerd Font
- YASB and Fastfetch (the exact installed versions were not recorded)

The repository scripts have not yet been validated on a clean Windows installation. Review the scripts and prompts before using them on another PC.

## Safety

LainOS is a desktop customization project, not a Windows debloater. Its scripts do not remove built-in apps, disable services, change Microsoft Defender, disable Windows Update, or modify security policies. Read docs/SECURITY.md before running scripts.

## Third-party projects

- GlazeWM: https://github.com/glzr-io/glazewm
- YASB: https://github.com/amnweb/yasb
- Win-Kitty (Windows port used by this setup): https://github.com/ecstra/win-kitty
- Kitty upstream: https://github.com/kovidgoyal/kitty
- Fastfetch: https://github.com/fastfetch-cli/fastfetch
- JetBrainsMono Nerd Font: https://www.nerdfonts.com/font-downloads

LainOS is an independent configuration project and is not affiliated with these projects.
