# configuro

Personal macOS and Ubuntu-compatible config files.

## Layout

- `kitty/` -> `~/.config/kitty/`
- `nvim/` -> `~/.config/nvim/`
- `tmux/` -> `~/.config/tmux/`

## Ubuntu Notes

Install the common runtime tools first:

```bash
sudo apt update
sudo apt install git tmux neovim kitty g++ latexmk zathura xdg-utils
```

Install TPM before starting tmux for the first time:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Then open tmux and press `prefix + I` to install tmux plugins.

## Portability Notes

- macOS-only tmux now-playing support is loaded only on Darwin.
- Neovim uses `g++-15` when available and falls back to `g++` on Ubuntu.
- VimTeX uses Skim on macOS, Zathura on Ubuntu when installed, and `xdg-open` otherwise.
- Installed plugin checkouts are ignored because plugin managers can recreate them.
