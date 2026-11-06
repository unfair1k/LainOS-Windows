[CmdletBinding()]
param([switch]$SkipApplications)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

function Install-WingetPackage([string]$Id, [string]$Name) {
    Write-Host ""
    Write-Host "[$Name] Installing or checking package..." -ForegroundColor Cyan
    & winget install --id $Id --exact --no-upgrade --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "WinGet returned exit code $LASTEXITCODE for $Name. Install it later with: winget install --id $Id --exact"
    }
}

Write-Host "== LainOS for Windows ==" -ForegroundColor Cyan
Write-Host "This installer does not remove Windows apps, disable services, change Defender, or modify Windows Update."
Write-Host "Existing configuration files are backed up before replacement."

if (-not $SkipApplications) {
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        throw "WinGet was not found. Install or update App Installer from Microsoft Store, then run this script again."
    }
    Write-Host ""
    Write-Host "Packages: GlazeWM, YASB, Fastfetch, JetBrainsMono Nerd Font."
    $answer = Read-Host "Install these four packages now? [Y/n]"
    if ($answer -notmatch '^(n|no)$') {
        Install-WingetPackage "glzr-io.glazewm" "GlazeWM"
        Install-WingetPackage "AmN.yasb" "YASB"
        Install-WingetPackage "Fastfetch-cli.Fastfetch" "Fastfetch"
        Install-WingetPackage "DEVCOM.JetBrainsMonoNerdFont" "JetBrainsMono Nerd Font"
    } else {
        Write-Host "Skipped application installation."
    }
} else {
    Write-Host "Skipped application installation (-SkipApplications)."
}

Write-Host ""
Write-Host "== Applying configuration ==" -ForegroundColor Cyan
& (Join-Path $RepoRoot "setup.ps1")
if ($LASTEXITCODE -ne 0) { throw "Configuration setup failed. Review the error above." }

Write-Host ""
Write-Host "Finished. Restart GlazeWM and YASB, then open Kitty and run: fastfetch" -ForegroundColor Green
Write-Host "Win-Kitty is not installed here because this rice uses a specific Windows build; install it separately."
Write-Host "Backups are stored in Documents\LainOS-Backups."
