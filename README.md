# .dotfiles

my config, managed with GNU stow.

| Config | Stows to |
|--------|----------|
| asdf | `~/.tool-versions`, `~/.default-npm-packages` |
| bat | `~/.config/bat/` |
| ghostty | `~/.config/ghostty/` |
| herdr | `~/.config/herdr/` |
| hunk | `~/.config/hunk/` |
| k9s | `~/.config/k9s/` |
| lazygit | `~/.config/lazygit/` |
| nvim-lazyvim | `~/.config/nvim/` |
| starship | `~/.config/starship.toml` |
| tmux | `~/.config/tmux/` |
| zsh | `~/` |

### Install 

Install [Homebrew](https://brew.sh)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Homebrew Packages

```bash
# Leaving a machine
brew leaves > leaves.txt

# Fresh installation
xargs brew install < leaves.txt
```

### Symlink dotfiles with stow

```bash
stow --ignore='.git' */

# optional: block commits when a package isn't linked into $HOME
git config core.hooksPath .githooks
```

### Install TPM for tmux

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

#### Manually Install Catppuccin

```sh
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```


then start a new tmux session and run prefix + I (prefix will be bound to ctrl + a)

### Programming Language Setup

Using asdf (installed via leaves.txt). Versions are pinned in `asdf/.tool-versions`,
which stows to `~/.tool-versions`.

```bash
asdf plugin add python
asdf plugin add dart
asdf plugin add golang
asdf plugin add nodejs
asdf plugin add java

# installs every version pinned in ~/.tool-versions
asdf install
```

New node versions automatically get the global packages listed in `~/.default-npm-packages`.
Go tools from `go install` land in `~/go/bin`, shared across Go versions.

 #### Inspired by:

- https://www.jakewiesler.com/blog/managing-dotfiles#understanding-stow 
- https://github.com/omerxx/dotfiles
- https://github.com/tylertreat/dotfiles
