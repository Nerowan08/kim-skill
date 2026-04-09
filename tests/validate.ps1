$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

Write-Host "[1/4] Checking required files..."
$Required = @(
  "README.md",
  "package.json",
  ".claude-plugin/plugin.json",
  ".cursor-plugin/plugin.json",
  "hooks/hooks.json",
  "hooks/session-start",
  "hooks/session-start.ps1",
  "hooks/run-hook.cmd",
  "skills/arming-command/SKILL.md",
  "skills/workflows/SKILL.md",
  "commands/workflows.md",
  "agents/war-room-director.md",
  "docs/platforms.md"
)

foreach ($File in $Required) {
  if (-not (Test-Path $File)) {
    throw "Missing: $File"
  }
}

Write-Host "[2/4] Checking JSON syntax..."
$JsonFiles = @(
  ".claude-plugin/plugin.json",
  ".cursor-plugin/plugin.json",
  "hooks/hooks.json",
  "package.json"
)
foreach ($File in $JsonFiles) {
  Get-Content $File -Raw | ConvertFrom-Json | Out-Null
}

Write-Host "[3/4] Checking frontmatter..."
$FilesToCheck = Get-ChildItem skills -Recurse -Filter "SKILL.md"
$FilesToCheck += Get-ChildItem commands -Filter "*.md"
$FilesToCheck += Get-ChildItem agents -Filter "*.md"

foreach ($Item in $FilesToCheck) {
  $FirstLine = (Get-Content $Item.FullName -TotalCount 1)
  if ($FirstLine -ne "---") {
    throw "Missing frontmatter: $($Item.FullName)"
  }
}

Write-Host "[4/4] Checking hook readability..."
& powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -File ".\hooks\session-start.ps1" | Out-Null

Write-Host "OK"
