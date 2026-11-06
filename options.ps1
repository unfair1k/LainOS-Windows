[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$Startup = [Environment]::GetFolderPath("Startup")

function Find-App([string]$Exe) {
    $command = Get-Command $Exe -ErrorAction SilentlyContinue
    if ($command) { return $command.Source }
    $candidates = @(
        (Join-Path $env:LOCALAPPDATA "Programs\$Exe"),
        (Join-Path $env:LOCALAPPDATA "Programs\GlazeWM\$Exe"),
        (Join-Path $env:LOCALAPPDATA "Programs\YASB\$Exe"),
        (Join-Path $env:ProgramFiles "GlazeWM\$Exe"),
        (Join-Path $env:ProgramFiles "YASB\$Exe")
    )
    foreach ($candidate in $candidates) { if (Test-Path $candidate) { return $candidate } }
    return $null
}

Write-Host ""
Write-Host "LainOS optional startup settings" -ForegroundColor Cyan
Write-Host "1. Enable GlazeWM + YASB at sign-in"
Write-Host "2. Disable LainOS startup shortcuts"
Write-Host "3. Exit"
$choice = Read-Host "Choose an option"

switch ($choice) {
    "1" {
        $shell = New-Object -ComObject WScript.Shell
        $apps = @(
            @{ Exe = "glazewm.exe"; Shortcut = "GlazeWM.lnk" },
            @{ Exe = "yasb.exe"; Shortcut = "YASB.lnk" }
        )
        foreach ($app in $apps) {
            $path = Find-App $app.Exe
            if (-not $path) {
                Write-Warning "$($app.Exe) was not found. Start it manually or install it first."
                continue
            }
            $shortcut = $shell.CreateShortcut((Join-Path $Startup $app.Shortcut))
            $shortcut.TargetPath = $path
            $shortcut.WorkingDirectory = Split-Path -Parent $path
            $shortcut.Save()
            Write-Host "Added $($app.Exe) to Startup." -ForegroundColor Green
        }
    }
    "2" {
        foreach ($name in @("GlazeWM.lnk", "YASB.lnk")) {
            $path = Join-Path $Startup $name
            if (Test-Path $path) { Remove-Item -LiteralPath $path -Force; Write-Host "Removed $name" }
        }
        Write-Host "LainOS startup shortcuts removed."
    }
    default { Write-Host "No changes made." }
}
Write-Host ""
Write-Host "THide is intentionally not installed or enabled. Hiding the taskbar is optional and can make recovery harder."
