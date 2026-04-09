# shijian — 一键安装脚本 (Windows PowerShell)
# Usage: iex (iwr -useb https://raw.githubusercontent.com/Mon-Ren/shijian/main/install.ps1).Content

$ErrorActionPreference = "Stop"

$Repo = "https://github.com/Mon-Ren/shijian.git"
$SkillsDir = if ($env:OPENCLAW_SKILLS) { $env:OPENCLAW_SKILLS } else { "$env:USERPROFILE\.openclaw\skills" }
$TmpDir = Join-Path $env:TEMP ("shijian-" + [guid]::NewGuid().ToString("N").Substring(0, 8))

function Info($msg) { Write-Host "[shijian] $msg" -ForegroundColor Green }
function Warn($msg) { Write-Host "[shijian] $msg" -ForegroundColor Yellow }

# Preflight
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "git is required but not found. Install Git for Windows first."
    exit 1
}

# Download
Info "downloading shijian..."
git clone --depth 1 $Repo "$TmpDir\shijian" 2>$null
if (-not $?) { Remove-Item -Recurse -Force $TmpDir -ErrorAction SilentlyContinue; Write-Error "clone failed"; exit 1 }

# Install
New-Item -ItemType Directory -Force -Path $SkillsDir | Out-Null
$count = 0

Get-ChildItem -Path "$TmpDir\shijian\skills" -Directory -Filter "shijian-*" | ForEach-Object {
    $name = $_.Name
    $target = Join-Path $SkillsDir $name

    if (Test-Path $target) {
        Warn "overwriting: $name"
        Remove-Item -Recurse -Force $target
    }

    Copy-Item -Recurse $_.FullName $target
    Info "installed: $name"
    $count++
}

# Cleanup
Remove-Item -Recurse -Force $TmpDir -ErrorAction SilentlyContinue

# Done
Write-Host ""
Info "installed $count skills to $SkillsDir"
Write-Host ""
Warn "optional — add '求是' constraints to your SOUL.md:"
Warn "  see SOUL-patch.md at https://github.com/Mon-Ren/shijian"
Write-Host ""
Info "restart OpenClaw to activate."
