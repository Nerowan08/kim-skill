$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Get-Content -Path (Join-Path $Root "skills/arming-command/SKILL.md") -Raw
