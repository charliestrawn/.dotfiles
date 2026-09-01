#!/usr/bin/env bash
# Verify that every file in each stow package is correctly symlinked into $HOME.
# Understands GNU stow's behavior of symlinking whole directories when possible,
# and only descending to individual files when something at $HOME already exists
# as a real (non-symlink) directory.
# Usage: ./check-stow.sh [package ...]   (defaults to all packages)

set -uo pipefail
cd "$(dirname "$0")"
DOTFILES_DIR="$(pwd)"

packages=("$@")
if [ ${#packages[@]} -eq 0 ]; then
  for d in */; do
    d="${d%/}"
    [ -d "$d/.git" ] && continue
    packages+=("$d")
  done
fi

status=0

check_entry() {
  # $1 = path to source entry (file or dir) inside package
  local src="$1"
  local rel="${src#"$DOTFILES_DIR"/}"
  rel="${rel#*/}"  # strip leading "<pkg>/"
  local target="$HOME/$rel"
  local src_abs
  src_abs="$(cd "$(dirname "$src")" && pwd)/$(basename "$src")"

  if [ -L "$target" ]; then
    local link resolved
    link=$(readlink "$target")
    case "$link" in
      /*) resolved="$link" ;;
      *)  resolved="$(cd "$(dirname "$target")" && cd "$(dirname "$link")" 2>/dev/null && pwd)/$(basename "$link")" ;;
    esac
    if [ "$resolved" = "$src_abs" ]; then
      return 0
    else
      echo "  WRONG LINK: $target -> $link (expected $src_abs)"
      return 1
    fi
  elif [ -d "$target" ] && [ -d "$src" ]; then
    # real directory at $target: stow descended here, check children individually
    local bad=0
    for child in "$src"/*; do
      [ -e "$child" ] || continue
      check_entry "$child" || bad=1
    done
    return $bad
  elif [ -e "$target" ]; then
    echo "  NOT SYMLINK (real file present, blocks stow): $target"
    return 1
  else
    echo "  MISSING (not stowed): $target  (source: $src)"
    return 1
  fi
}

for pkg in "${packages[@]}"; do
  pkg="${pkg%/}"
  if [ ! -d "$pkg" ]; then
    echo "== $pkg == (skipped, not a directory)"
    continue
  fi

  entries=$(find "$pkg" -mindepth 1 -maxdepth 1)
  if [ -z "$entries" ]; then
    echo "== $pkg == (EMPTY PACKAGE - nothing to stow)"
    status=1
    continue
  fi

  echo "== $pkg =="
  ok=1
  while IFS= read -r e; do
    check_entry "$DOTFILES_DIR/$e" || ok=0
  done <<< "$entries"

  [ "$ok" -eq 1 ] && echo "  OK"
  [ "$ok" -eq 0 ] && status=1
done

exit $status
