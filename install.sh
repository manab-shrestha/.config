#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$config_dir"

link_config() {
  local name="$1"
  local source="$repo_dir/$name"
  local target="$config_dir/$name"

  if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
    printf '%s already linked\n' "$target"
    return
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    local backup="$target.bak-$(date +%Y%m%d%H%M%S)"
    mv "$target" "$backup"
    printf 'moved existing %s to %s\n' "$target" "$backup"
  fi

  ln -s "$source" "$target"
  printf 'linked %s -> %s\n' "$target" "$source"
}

link_config kitty
link_config nvim
link_config tmux

case "$(uname -s)" in
  Darwin)
    printf '\nmacOS detected. Install common dependencies with Homebrew if needed:\n'
    printf '  brew install git tmux neovim kitty bash gcc latexmk\n'
    ;;
  Linux)
    printf '\nLinux detected. On Ubuntu, install common dependencies if needed:\n'
    printf '  sudo apt install git tmux neovim kitty g++ latexmk zathura xdg-utils bash\n'
    ;;
esac

printf '\nInstall TPM if missing:\n'
printf '  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm\n'
