# LainOS for Windows

A dark, minimal Windows desktop rice inspired by Serial Experiments Lain and the idea of **Navi**: a navy-black interface, cyan accents, translucent surfaces, a tiling window manager, a custom top bar, and a clean terminal.

LainOS includes an optional PowerShell installer that installs the core tools, applies the rice, and backs up existing configuration files first.

## Quick start

1. Download **Code → Download ZIP** from GitHub and extract it. Or clone it if Git is installed:
    
        git clone https://github.com/unfair1k/LainOS-Windows.git
        cd LainOS-Windows

2. Open PowerShell in the extracted repository folder.
3. Run:

        Set-ExecutionPolicy -Scope Process Bypass -Force
        .\install.ps1

4. Review the package prompt. WinGet installs GlazeWM, YASB, Fastfetch, and JetBrainsMono Nerd Font.
5. Restart GlazeWM and YASB. Install your preferred Win-Kitty build separately, then open Kitty and run fastfetch.

The installer does not need Administrator rights for the configuration-copy step. WinGet may request elevation depending on the package installer and Windows setup.

## Installer scripts

| Script | Purpose |
|---|---|
| install.ps1 | Installs core applications with WinGet, then applies the configuration |
| setup.ps1 | Backs up existing config files and copies the LainOS rice |
| restore.ps1 | Restores the most recent backup (or a selected snapshot) |
| options.ps1 | Enables or disables GlazeWM/YASB startup shortcuts |

Install applications only:

    .\install.ps1 -SkipApplications

Apply configs only:

    .\setup.ps1

Manage startup:

    .\options.ps1

Restore the newest backup:

    .\restore.ps1

Backups are stored under Documents\LainOS-Backups. Restore returns configuration files only; it does not uninstall applications.

## Design

- **Palette:** deep navy #0b0e17, pale blue text #c8d5f0, cyan accent #00e5ff
- **Window manager:** GlazeWM
- **Status bar:** YASB
- **Terminal:** Win-Kitty
- **System information:** Fastfetch
- **Taskbar:** THide (optional, manual only)

## Layout

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
      SECURITY.md
    install.ps1
    setup.ps1
    restore.ps1
    options.ps1

## Important notes

- Win-Kitty is not installed automatically because this setup uses a specific Windows build. Install it separately.
- The Kitty wallpaper is optional. If %USERPROFILE%\.config\kitty\lain-room.jpg is absent, setup disables the wallpaper directive instead of leaving a broken path.
- The YASB wallpaper gallery is pointed to %USERPROFILE%\Pictures\Wallpapers; add your own images there.
- THide is not bundled or enabled by the installer. Hiding the taskbar is optional and can make recovery harder.
- Wallpapers, fonts, and third-party executables are not redistributed by this repository.

## Safety

LainOS is a desktop customization project, not a Windows debloater. Its scripts do not remove built-in apps, disable services, change Defender, disable Windows Update, edit security policies, or apply registry tweaks. Read docs/SECURITY.md before running scripts.

## Credits

This rice combines configuration for third-party projects. Their software and assets remain the property of their respective authors. See docs/INSTALL.md for upstream links.
