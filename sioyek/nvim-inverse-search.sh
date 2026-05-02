#!/usr/bin/env bash
set -euo pipefail

file="${1:-}"
line="${2:-1}"
server="${NVIM_SERVER:-${XDG_CACHE_HOME:-$HOME/.cache}/nvim/server.pipe}"

if [[ -z "$file" ]]; then
  exit 0
fi

if command -v nvr >/dev/null 2>&1; then
  nvr="$(command -v nvr)"
elif [[ -x "$HOME/Library/Python/3.9/bin/nvr" ]]; then
  nvr="$HOME/Library/Python/3.9/bin/nvr"
else
  exit 127
fi

escaped_file="${file//\\/\\\\}"
escaped_file="${escaped_file//\'/\'\\\'\'}"

"$nvr" --servername "$server" --nostart --remote-send "<Cmd>VimtexInverseSearch ${line} '${escaped_file}'<CR>"
