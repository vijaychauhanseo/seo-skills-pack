#!/bin/zsh
set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"

mkdir -p "$CODEX_HOME/skills" "$CODEX_HOME/memories"
rsync -a "$REPO_ROOT/skills/" "$CODEX_HOME/skills/"
rsync -a "$REPO_ROOT/memories/" "$CODEX_HOME/memories/"

echo "Installed SEO skills pack to $CODEX_HOME"
echo "Skills copied to: $CODEX_HOME/skills"
echo "Memories copied to: $CODEX_HOME/memories"
