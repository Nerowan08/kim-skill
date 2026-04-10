#!/usr/bin/env sh
set -eu

STRICT=0
if [ "${1:-}" = "--strict" ]; then
  STRICT=1
fi

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

fail() {
  echo "ERROR: $1" >&2
  exit 1
}

warn() {
  echo "WARN: $1" >&2
}

check_required_files() {
  for file in $1; do
    [ -f "$file" ] || fail "Missing: $file"
  done
}

check_json_files() {
  PYTHON_BIN="${PYTHON_BIN:-python3}"
  command -v "$PYTHON_BIN" >/dev/null 2>&1 || PYTHON_BIN=python
  command -v "$PYTHON_BIN" >/dev/null 2>&1 || fail "python or python3 is required for JSON validation"

  for file in $1; do
    "$PYTHON_BIN" -m json.tool "$file" >/dev/null 2>&1 || fail "Invalid JSON: $file"
  done
}

check_frontmatter() {
  for file in skills/*/SKILL.md commands/*.md agents/*.md; do
    [ -f "$file" ] || continue
    first_line=$(head -n 1 "$file" || true)
    [ "$first_line" = "---" ] || fail "Missing frontmatter: $file"
  done
}

check_command_skill_parity() {
  for file in commands/*.md; do
    [ -f "$file" ] || continue
    base=$(basename "$file" .md)
    [ "$base" = "workflows" ] && continue
    [ -f "skills/$base/SKILL.md" ] || fail "Command without matching skill: $file"
  done

  for dir in skills/*; do
    [ -d "$dir" ] || continue
    base=$(basename "$dir")
    case "$base" in
      arming-command|command-core|workflows)
        continue
        ;;
    esac
    [ -f "commands/$base.md" ] || fail "Skill without matching command: $dir/SKILL.md"
  done
}

check_tracked_release_files() {
  [ -d .git ] || return 0
  command -v git >/dev/null 2>&1 || return 0

  for file in .claude-plugin/plugin.json .cursor-plugin/plugin.json .github/workflows/pages.yml site/index.html site/guide/index.html site/skills/index.html site/examples/index.html; do
    git ls-files --error-unmatch "$file" >/dev/null 2>&1 || fail "Release file exists locally but is not tracked by git: $file"
  done
}

CORE_REQUIRED="
README.md
package.json
hooks/hooks.json
hooks/session-start
hooks/session-start.ps1
hooks/run-hook.cmd
docs/platforms.md
skills/arming-command/SKILL.md
skills/command-core/SKILL.md
skills/workflows/SKILL.md
commands/workflows.md
agents/war-room-director.md
agents/inspection-officer.md
"

OPTIONAL_RELEASE="
.claude-plugin/plugin.json
.cursor-plugin/plugin.json
.codex/INSTALL.md
.opencode/INSTALL.md
docs/github-pages.md
.github/workflows/pages.yml
site/index.html
site/guide/index.html
site/skills/index.html
site/examples/index.html
site/assets/site.css
site/.nojekyll
site/404.html
site/robots.txt
"

echo "[1] Checking core files..."
check_required_files "$CORE_REQUIRED"

if [ "$STRICT" -eq 1 ]; then
  echo "[2] Checking full release files..."
  check_required_files "$OPTIONAL_RELEASE"
else
  for file in $OPTIONAL_RELEASE; do
    [ -f "$file" ] || warn "Optional release file not found: $file"
  done
fi

echo "[3] Checking JSON syntax..."
JSON_REQUIRED="hooks/hooks.json package.json"
JSON_OPTIONAL=".claude-plugin/plugin.json .cursor-plugin/plugin.json"
check_json_files "$JSON_REQUIRED"
for file in $JSON_OPTIONAL; do
  if [ -f "$file" ]; then
    check_json_files "$file"
  elif [ "$STRICT" -eq 1 ]; then
    fail "Missing optional JSON in strict mode: $file"
  fi
done

echo "[4] Checking frontmatter..."
check_frontmatter

echo "[5] Checking command/skill parity..."
check_command_skill_parity

echo "[6] Checking hook readability..."
sh hooks/session-start >/dev/null || fail "hooks/session-start is not readable"

if [ "$STRICT" -eq 1 ]; then
  echo "[7] Checking tracked release files (when git is available)..."
  check_tracked_release_files
fi

echo "OK"
