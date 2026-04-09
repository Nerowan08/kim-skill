#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

echo "[1/4] Checking required files..."
required_files="
README.md
package.json
.claude-plugin/plugin.json
.cursor-plugin/plugin.json
hooks/hooks.json
hooks/session-start
hooks/session-start.ps1
hooks/run-hook.cmd
skills/arming-command/SKILL.md
skills/workflows/SKILL.md
commands/workflows.md
agents/war-room-director.md
docs/platforms.md
"
for file in $required_files; do
  [ -f "$file" ] || { echo "Missing: $file"; exit 1; }
done

echo "[2/4] Checking JSON syntax..."
json_files=".claude-plugin/plugin.json .cursor-plugin/plugin.json hooks/hooks.json package.json"
PYTHON_BIN="${PYTHON_BIN:-python3}"
command -v "$PYTHON_BIN" >/dev/null 2>&1 || PYTHON_BIN=python
for file in $json_files; do
  "$PYTHON_BIN" -m json.tool "$file" >/dev/null 2>&1 || { echo "Invalid JSON: $file"; exit 1; }
done

echo "[3/4] Checking frontmatter..."
check_frontmatter () {
  file="$1"
  first_line=$(head -n 1 "$file" || true)
  [ "$first_line" = "---" ] || { echo "Missing frontmatter: $file"; exit 1; }
}
for file in skills/*/SKILL.md commands/*.md agents/*.md; do
  check_frontmatter "$file"
done

echo "[4/4] Checking hook readability..."
sh hooks/session-start >/dev/null
echo "OK"
