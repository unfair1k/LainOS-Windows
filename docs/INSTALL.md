# Installation

LainOS includes PowerShell scripts for a guided setup. They install only the listed desktop tools and copy the repository's configuration files after creating a backup.

## 1. Get the repository

Download **Code → Download ZIP** from GitHub and extract it, or clone it if Git is already installed:

    git clone https://github.com/unfair1k/LainOS-Windows.git
    cd LainOS-Windows

Open PowerShell in the extracted folder.

## 2. Run the installer

    Set-ExecutionPolicy -Scope Process Bypass -Force
    .\install.ps1

The execution-policy change applies only to the current PowerShell process. The installer asks before installing these WinGet packages:

- GlazeWM — glzr-io.glazewm
- YASB — AmN.yasb
- Fastfetch — Fastfetch-cli.Fastfetch
- JetBrainsMono Nerd Font — DEVCOM.JetBrainsMonoNerdFont

WinGet may request elevation for an individual package, depending on its installer and Windows configuration. Review any installer prompts.

Win-Kitty is not installed automatically. This rice uses a specific Windows build; install your preferred compatible Win-Kitty build separately.

## 3. What setup changes

The setup script copies the repository configs to:

| Repository file | Destination |
|---|---|
| configs/glazewm/config.yaml | %USERPROFILE%\.glzr\glazewm\config.yaml |
| configs/kitty/kitty.conf | %USERPROFILE%\.config\kitty\kitty.conf |
| configs/fastfetch/config.jsonc | %USERPROFILE%\.config\fastfetch\config.jsonc |
| configs/yasb/config.yaml | %USERPROFILE%\.config\yasb\config.yaml |
| configs/yasb/styles.css | %USERPROFILE%\.config\yasb\styles.css |
| configs/yasb/yasb_colors.css | %USERPROFILE%\.config\yasb\yasb_colors.css |

Existing files are backed up before replacement to Documents\LainOS-Backups\<timestamp>\.

Machine-specific wallpaper paths are handled safely:
- If %USERPROFILE%\.config\kitty\lain-room.jpg exists, Kitty is pointed to it. Otherwise, the Kitty wallpaper directive is commented out.
- YASB's wallpaper gallery is pointed to %USERPROFILE%\Pictures\Wallpapers, which setup creates if needed.

## 4. Optional startup

Run:

    .\options.ps1

Choose option 1 to create GlazeWM and YASB shortcuts in the current user's Startup folder, or option 2 to remove those shortcuts. If an executable cannot be located automatically, start that app manually or configure its startup entry yourself.

## 5. Restore your previous configuration

Run:

    .\restore.ps1

The script selects the newest backup and asks for confirmation. To choose a specific snapshot:

    .\restore.ps1 -BackupPath "$env:USERPROFILE\Documents\LainOS-Backups\20261106-120000"

Restore returns files that existed before setup. It does not uninstall applications or remove newly created config files that had no previous version.

## 6. Optional taskbar hiding

THide is not included, downloaded, or enabled by these scripts. It is a separate optional customization. Verify its original source and test its recovery method before using it.

## Troubleshooting

- **WinGet not found:** install or update App Installer from Microsoft Store.
- **Kitty wallpaper missing:** place your own image at %USERPROFILE%\.config\kitty\lain-room.jpg and uncomment/update the background_image directive.
- **YASB wallpaper gallery empty:** add supported images to %USERPROFILE%\Pictures\Wallpapers.
- **YASB widget error:** check widget names and options against the current YASB documentation.
- **GlazeWM shortcut does nothing:** confirm GlazeWM is running and check for conflicting hotkeys.
- **Font looks wrong:** confirm JetBrainsMono Nerd Font is installed and restart the terminal.

## Official project links

- GlazeWM: https://github.com/glzr-io/glazewm
- YASB: https://github.com/amnweb/yasb
- YASB installation guide: https://docs.yasb.dev/latest/installation.html
- Kitty: https://github.com/kovidgoyal/kitty
- Fastfetch: https://github.com/fastfetch-cli/fastfetch
- JetBrainsMono Nerd Font: https://www.nerdfonts.com/font-downloads
