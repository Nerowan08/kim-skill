param(
  [switch]$Strict
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

function Fail($Message) {
  throw $Message
}

function Warn($Message) {
  Write-Warning $Message
}

function Check-RequiredFiles([string[]]$Files) {
  foreach ($File in $Files) {
    if (-not (Test-Path $File)) {
      Fail "Missing: $File"
    }
  }
}

function Check-JsonFiles([string[]]$Files) {
  foreach ($File in $Files) {
    Get-Content $File -Raw | ConvertFrom-Json | Out-Null
  }
}

function Check-Frontmatter {
  $FilesToCheck = @()
  $FilesToCheck += Get-ChildItem skills -Recurse -Filter "SKILL.md"
  $FilesToCheck += Get-ChildItem commands -Filter "*.md"
  $FilesToCheck += Get-ChildItem agents -Filter "*.md"

  foreach ($Item in $FilesToCheck) {
    $FirstLine = (Get-Content $Item.FullName -TotalCount 1)
    if ($FirstLine -ne "---") {
      Fail "Missing frontmatter: $($Item.FullName)"
    }
  }
}

function Check-CommandSkillParity {
  foreach ($Item in Get-ChildItem commands -Filter "*.md") {
    $Base = [System.IO.Path]::GetFileNameWithoutExtension($Item.Name)
    if ($Base -eq "workflows") { continue }
    $SkillPath = Join-Path "skills" $Base
    $SkillPath = Join-Path $SkillPath "SKILL.md"
    if (-not (Test-Path $SkillPath)) {
      Fail "Command without matching skill: $($Item.FullName)"
    }
  }

  foreach ($Dir in Get-ChildItem skills -Directory) {
    if ($Dir.Name -in @("arming-command", "command-core", "workflows")) { continue }
    $CommandPath = Join-Path "commands" ($Dir.Name + ".md")
    if (-not (Test-Path $CommandPath)) {
      Fail "Skill without matching command: $(Join-Path $Dir.FullName 'SKILL.md')"
    }
  }
}

function Check-TrackedReleaseFiles {
  if (-not (Test-Path .git)) { return }
  if (-not (Get-Command git -ErrorAction SilentlyContinue)) { return }

  $Tracked = @(
    ".claude-plugin/plugin.json",
    ".cursor-plugin/plugin.json",
    ".github/workflows/pages.yml",
    "site/index.html",
    "site/guide/index.html",
    "site/skills/index.html",
    "site/examples/index.html"
  )

  foreach ($File in $Tracked) {
    & git ls-files --error-unmatch $File *> $null
    if ($LASTEXITCODE -ne 0) {
      Fail "Release file exists locally but is not tracked by git: $File"
    }
  }
}

$CoreRequired = @(
  "README.md",
  "package.json",
  "hooks/hooks.json",
  "hooks/session-start",
  "hooks/session-start.ps1",
  "hooks/run-hook.cmd",
  "docs/platforms.md",
  "skills/arming-command/SKILL.md",
  "skills/command-core/SKILL.md",
  "skills/workflows/SKILL.md",
  "commands/workflows.md",
  "agents/war-room-director.md",
  "agents/inspection-officer.md"
)

$OptionalRelease = @(
  ".claude-plugin/plugin.json",
  ".cursor-plugin/plugin.json",
  ".codex/INSTALL.md",
  ".opencode/INSTALL.md",
  "docs/github-pages.md",
  ".github/workflows/pages.yml",
  "site/index.html",
  "site/guide/index.html",
  "site/skills/index.html",
  "site/examples/index.html",
  "site/assets/site.css",
  "site/.nojekyll",
  "site/404.html",
  "site/robots.txt"
)

Write-Host "[1] Checking core files..."
Check-RequiredFiles $CoreRequired

if ($Strict) {
  Write-Host "[2] Checking full release files..."
  Check-RequiredFiles $OptionalRelease
} else {
  foreach ($File in $OptionalRelease) {
    if (-not (Test-Path $File)) {
      Warn "Optional release file not found: $File"
    }
  }
}

Write-Host "[3] Checking JSON syntax..."
Check-JsonFiles @("hooks/hooks.json", "package.json")
foreach ($File in @(".claude-plugin/plugin.json", ".cursor-plugin/plugin.json")) {
  if (Test-Path $File) {
    Check-JsonFiles @($File)
  } elseif ($Strict) {
    Fail "Missing optional JSON in strict mode: $File"
  }
}

Write-Host "[4] Checking frontmatter..."
Check-Frontmatter

Write-Host "[5] Checking command/skill parity..."
Check-CommandSkillParity

Write-Host "[6] Checking hook readability..."
if (Get-Command powershell -ErrorAction SilentlyContinue) {
  & powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -File ".\hooks\session-start.ps1" | Out-Null
} elseif (Get-Command pwsh -ErrorAction SilentlyContinue) {
  & pwsh -NoLogo -NoProfile -File ".\hooks\session-start.ps1" | Out-Null
} else {
  Fail "powershell or pwsh is required to validate hooks/session-start.ps1"
}

if ($Strict) {
  Write-Host "[7] Checking tracked release files (when git is available)..."
  Check-TrackedReleaseFiles
}

Write-Host "OK"
