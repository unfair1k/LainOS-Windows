[CmdletBinding()]
param([string]$BackupPath)

$ErrorActionPreference = "Stop"
$BackupRoot = Join-Path $env:USERPROFILE "Documents\LainOS-Backups"

if (-not $BackupPath) {
    if (-not (Test-Path $BackupRoot)) { throw "No LainOS backup folder was found at $BackupRoot" }
    $latest = Get-ChildItem -LiteralPath $BackupRoot -Directory | Sort-Object Name -Descending | Select-Object -First 1
    if (-not $latest) { throw "No backup snapshots were found." }
    $BackupPath = $latest.FullName
}
if (-not (Test-Path (Join-Path $BackupPath "BACKUP-INFO.txt"))) {
    throw "The selected folder does not look like a LainOS backup: $BackupPath"
}

$Mappings = @(
    @{ Relative = "configs\glazewm\config.yaml"; Destination = Join-Path $env:USERPROFILE ".glzr\glazewm\config.yaml" },
    @{ Relative = "configs\kitty\kitty.conf"; Destination = Join-Path $env:USERPROFILE ".config\kitty\kitty.conf" },
    @{ Relative = "configs\fastfetch\config.jsonc"; Destination = Join-Path $env:USERPROFILE ".config\fastfetch\config.jsonc" },
    @{ Relative = "configs\yasb\config.yaml"; Destination = Join-Path $env:USERPROFILE ".config\yasb\config.yaml" },
    @{ Relative = "configs\yasb\styles.css"; Destination = Join-Path $env:USERPROFILE ".config\yasb\styles.css" },
    @{ Relative = "configs\yasb\yasb_colors.css"; Destination = Join-Path $env:USERPROFILE ".config\yasb\yasb_colors.css" }
)

Write-Host "Restore snapshot: $BackupPath" -ForegroundColor Cyan
$confirm = Read-Host "Restore the files contained in this backup? [y/N]"
if ($confirm -notmatch '^(y|yes)$') { Write-Host "Restore cancelled."; exit 0 }

foreach ($mapping in $Mappings) {
    $source = Join-Path $BackupPath $mapping.Relative
    if (Test-Path $source) {
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $mapping.Destination) | Out-Null
        Copy-Item -LiteralPath $source -Destination $mapping.Destination -Force
        Write-Host "Restored $($mapping.Relative)" -ForegroundColor Green
    }
}
Write-Host "Restore complete. This restores configuration files only; it does not uninstall applications."
