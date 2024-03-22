# .dotfiles

my config, managed with GNU stow. Inspired by https://www.jakewiesler.com/blog/managing-dotfiles#understanding-stow and https://github.com/omerxx/dotfiles

### Config for:

- Alacritty (terminal)
- bat (cat with syntax highlighting)
- homebrew 
- neovim
- shell
- tmux

### Install 

The setup script needs some work still, but:

```bash
./setup.sh
```


### Homebrew Packages
```bash
# Leaving a machine
mkdir -p homebrew
brew leaves > homebrew/leaves.txt

# Fresh installation
xargs brew install < homebrew/leaves.txt
```

