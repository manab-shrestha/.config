# dotfiles

Personal config files shared between macOS and Ubuntu/Linux.

## Layout

- `kitty/` -> `~/.config/kitty/`
- `nvim/` -> `~/.config/nvim/`
- `tmux/` -> `~/.config/tmux/`

## Install

Clone the repo, then run:

```bash
./install.sh
```

The installer symlinks `kitty`, `nvim`, and `tmux` into `~/.config`. Existing real directories are moved aside with a timestamped `.bak-...` suffix.

## Dependencies

Ubuntu/Linux:


```bash
sudo apt update
sudo apt install git tmux neovim kitty g++ latexmk zathura xdg-utils bash
```

macOS:

```bash
brew install git tmux neovim kitty bash gcc latexmk
```

TPM is needed before starting tmux for the first time:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Then open tmux and press `prefix + I` to install tmux plugins.

## Portability Notes

- macOS-only tmux now-playing support is loaded only on Darwin.
- Neovim uses `g++-15` when available and falls back to `g++` everywhere else.
- VimTeX uses Skim on macOS, Zathura on Linux when installed, and `xdg-open` otherwise.
- Installed plugin checkouts are ignored because plugin managers can recreate them.
