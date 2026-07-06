#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
ln -sfn "$DIR" ~/.dotfiles
DARWIN_REBUILD="$(command -v darwin-rebuild || true)"
if [[ -z "$DARWIN_REBUILD" && -x /run/current-system/sw/bin/darwin-rebuild ]]; then
  DARWIN_REBUILD=/run/current-system/sw/bin/darwin-rebuild
fi
if [[ -z "$DARWIN_REBUILD" ]]; then
  echo "darwin-rebuild not found. Open a new terminal or rerun ./bootstrap.sh first." >&2
  exit 1
fi
exec sudo "$DARWIN_REBUILD" switch --flake ~/.dotfiles#mac
