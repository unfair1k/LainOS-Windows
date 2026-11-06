# Security and system changes

LainOS is a desktop customization setup. It is not a debloating utility and does not attempt to optimize Windows by disabling built-in components.

## What the scripts do

- Use WinGet to install the named desktop applications when the user approves.
- Copy the rice's configuration files into the current user's profile.
- Create timestamped backups of configuration files before replacing them.
- Optionally create or remove GlazeWM and YASB shortcuts in the current user's Startup folder.

## What the scripts do not do

- Remove Microsoft Store apps or other Windows components.
- Disable Windows services, scheduled tasks, Defender, SmartScreen, Firewall, or Windows Update.
- Change registry policies, telemetry settings, DNS, network adapters, or security settings.
- Download or execute third-party binaries outside WinGet.
- Install or enable THide, hide the taskbar, or force a restart.

## Before running

1. Download the repository from its official GitHub page.
2. Read the PowerShell scripts before execution if you want to inspect every operation.
3. Run from the extracted repository folder so relative config paths resolve correctly.
4. Keep the generated backup folder until you have confirmed the rice works.

The execution-policy command in the installation guide uses Scope Process, so it changes policy only for the current PowerShell process. It does not permanently change the user's execution policy.

## Rollback

Run restore.ps1 from the repository folder and confirm the selected backup. Rollback restores configuration files only. Applications installed by WinGet must be uninstalled separately through Windows Settings or WinGet if desired.

## Third-party software

GlazeWM, YASB, Kitty, Fastfetch, and Nerd Fonts are maintained by their respective authors. Review their official project pages and licenses. WinGet package manifests and installers are maintained by their publishers and package maintainers; package IDs are pinned in the installer for exact matching, but package versions are not pinned.
