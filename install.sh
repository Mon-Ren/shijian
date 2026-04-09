#!/bin/sh
# shijian — 一键安装脚本 (macOS / Linux)
# Usage: curl -fsSL https://raw.githubusercontent.com/Mon-Ren/shijian/main/install.sh | sh

set -e

REPO="https://github.com/Mon-Ren/shijian.git"
SKILLS_DIR="${OPENCLAW_SKILLS:-$HOME/.openclaw/skills}"
TMPDIR=$(mktemp -d 2>/dev/null || mktemp -d -t shijian)

# Terminal colors
if [ -t 1 ]; then
  G='\033[0;32m' Y='\033[1;33m' R='\033[0m'
else
  G='' Y='' R=''
fi

info()  { printf "${G}[shijian]${R} %s\n" "$*"; }
warn()  { printf "${Y}[shijian]${R} %s\n" "$*"; }
die()   { printf "${R}[shijian] error:${R} %s\n" "$*" >&2; exit 1; }

# Preflight
command -v git >/dev/null 2>&1 || die "git is required but not found"

# Download
info "downloading shijian..."
git clone --depth 1 "$REPO" "$TMPDIR/shijian" >/dev/null 2>&1 || die "clone failed"

# Install
mkdir -p "$SKILLS_DIR"
count=0

for skill_dir in "$TMPDIR"/shijian/skills/shijian-*/; do
  [ -d "$skill_dir" ] || continue
  name=$(basename "$skill_dir")
  target="$SKILLS_DIR/$name"

  [ -d "$target" ] && warn "overwriting: $name"
  rm -rf "$target"
  cp -r "$skill_dir" "$target"
  info "installed: $name"
  count=$((count + 1))
done

# Cleanup
rm -rf "$TMPDIR"

# Done
echo ""
info "installed $count skills to $SKILLS_DIR"
echo ""
warn "optional — add '求是' constraints to your SOUL.md:"
warn "  see SOUL-patch.md at https://github.com/Mon-Ren/shijian"
echo ""
info "restart OpenClaw to activate."
