# .dotfiles

my dotfiles, managed with GNU stow. Inspired by https://www.jakewiesler.com/blog/managing-dotfiles#understanding-stow and https://github.com/omerxx/dotfiles


### Install with stow:

```bash
stow --target ~/.config .
```

### Homebrew installation:

```bash
# Leaving a machine
mkdir -p homebrew
brew leaves > homebrew/leaves.txt

# Fresh installation
xargs brew install < homebrew/leaves.txt
```


TODO: 

- [x] nvim
- [x] tmux
- [ ] zsh
- [ ] brew
- [ ] git
