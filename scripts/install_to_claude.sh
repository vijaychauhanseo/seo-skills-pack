#!/bin/zsh
set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"

mkdir -p "$CLAUDE_HOME/skills" "$CLAUDE_HOME/agents"
CLAUDE_HOME="$(cd "$CLAUDE_HOME" && pwd)"

rsync -a "$REPO_ROOT/skills/" "$CLAUDE_HOME/skills/"
rsync -a "$REPO_ROOT/adapters/claude-code/agents/" "$CLAUDE_HOME/agents/"
cp "$REPO_ROOT/adapters/claude-code/user-memory/seo-skills-pack.md" "$CLAUDE_HOME/seo-skills-pack.md"

touch "$CLAUDE_HOME/CLAUDE.md"
IMPORT_LINE="@$CLAUDE_HOME/seo-skills-pack.md"
if ! rg -F "$IMPORT_LINE" "$CLAUDE_HOME/CLAUDE.md" >/dev/null 2>&1; then
  {
    printf "\n# SEO Skills Pack\n"
    printf "%s\n" "$IMPORT_LINE"
  } >> "$CLAUDE_HOME/CLAUDE.md"
fi

echo "Installed SEO skills pack to Claude home: $CLAUDE_HOME"
echo "Skills copied to: $CLAUDE_HOME/skills"
echo "Agents copied to: $CLAUDE_HOME/agents"
echo "Memory import added via: $CLAUDE_HOME/CLAUDE.md"
