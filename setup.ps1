[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$Stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$BackupRoot = Join-Path $env:USERPROFILE "Documents\LainOS-Backups\$Stamp"

$Targets = @(
    @{ Source = "configs\glazewm\config.yaml"; Destination = Join-Path $env:USERPROFILE ".glzr\glazewm\config.yaml"; Name = "GlazeWM" },
    @{ Source = "configs\kitty\kitty.conf"; Destination = Join-Path $env:USERPROFILE ".config\kitty\kitty.conf"; Name = "Kitty" },
    @{ Source = "configs\fastfetch\config.jsonc"; Destination = Join-Path $env:USERPROFILE ".config\fastfetch\config.jsonc"; Name = "Fastfetch" },
    @{ Source = "configs\yasb\config.yaml"; Destination = Join-Path $env:USERPROFILE ".config\yasb\config.yaml"; Name = "YASB config" },
    @{ Source = "configs\yasb\styles.css"; Destination = Join-Path $env:USERPROFILE ".config\yasb\styles.css"; Name = "YASB styles" },
    @{ Source = "configs\yasb\yasb_colors.css"; Destination = Join-Path $env:USERPROFILE ".config\yasb\yasb_colors.css"; Name = "YASB colors" }
)

Write-Host "Preparing LainOS configuration..." -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path $BackupRoot | Out-Null

foreach ($item in $Targets) {
    $sourcePath = Join-Path $RepoRoot $item.Source
    if (-not (Test-Path $sourcePath)) { throw "Required repository file is missing: $($item.Source)" }

    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $item.Destination) | Out-Null
    if (Test-Path $item.Destination) {
        $backupPath = Join-Path $BackupRoot $item.Source
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $backupPath) | Out-Null
        Copy-Item -LiteralPath $item.Destination -Destination $backupPath -Force
        Write-Host "Backed up $($item.Name)" -ForegroundColor DarkGray
    }

    $content = Get-Content -LiteralPath $sourcePath -Raw
    if ($item.Name -eq "Kitty") {
        $wallpaper = Join-Path $env:USERPROFILE ".config\kitty\lain-room.jpg"
        if (Test-Path $wallpaper) {
            $portablePath = $wallpaper -replace '\\','/'
            $content = [regex]::Replace($content, '(?m)^background_image\s+.*$', "background_image $portablePath")
        } else {
            $content = [regex]::Replace($content, '(?m)^(background_image\s+.*)$', '# $1')
            Write-Host "Kitty wallpaper not found; its wallpaper line was disabled." -ForegroundColor Yellow
        }
    }

    if ($item.Name -eq "YASB config") {
        $wallpaperDir = Join-Path $env:USERPROFILE "Pictures\Wallpapers"
        New-Item -ItemType Directory -Force -Path $wallpaperDir | Out-Null
        $yamlPath = $wallpaperDir -replace '\\','\\'
        $content = [regex]::Replace($content, '(?m)^\s*image_path:\s*.*$',
            ('      image_path: "' + $yamlPath + '"'))
    }

    Set-Content -LiteralPath $item.Destination -Value $content -Encoding UTF8
    Write-Host "Installed $($item.Name)" -ForegroundColor Green
}

@"
LainOS configuration backup
Created: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
Original files are stored in this folder using their repository-relative paths.
Use restore.ps1 from the LainOS repository to restore the newest backup.
"@ | Set-Content -LiteralPath (Join-Path $BackupRoot "BACKUP-INFO.txt") -Encoding UTF8

Write-Host ""
Write-Host "Configuration applied." -ForegroundColor Green
Write-Host "Backup: $BackupRoot"
Write-Host "No Windows services, security settings, installed apps, or system policies were changed."
