# .dotfiles

my config, managed with GNU stow.

- Alacritty (terminal)
- bat (cat with syntax highlighting)
- homebrew 
- neovim
- shell
- tmux

### Install 

Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Homebrew Packages

```bash
# Leaving a machine
brew leaves > leaves.txt

# Fresh installation
xargs brew install leaves.txt
```

### Install oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


### Symlink dotfiles with stow

```bash
stow /*
```

### Install TPM for tmux

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

then start a new tmux session and run prefix + I (prefix will be bound to ctrl + a)


 #### Inspired by:

- https://www.jakewiesler.com/blog/managing-dotfiles#understanding-stow 
- https://github.com/omerxx/dotfiles
- https://github.com/tylertreat/dotfiles


