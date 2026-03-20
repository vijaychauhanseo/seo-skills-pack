#!/bin/zsh
set -eu

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 /path/to/agent/skills" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET_SKILLS_DIR="$1"

mkdir -p "$TARGET_SKILLS_DIR"
TARGET_SKILLS_DIR="$(cd "$TARGET_SKILLS_DIR" && pwd)"

rsync -a "$REPO_ROOT/skills/" "$TARGET_SKILLS_DIR/"

echo "Installed open-standard SEO skills to: $TARGET_SKILLS_DIR"
echo "These skills are compatible with tools that support SKILL.md / Agent Skills."
