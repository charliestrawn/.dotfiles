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

### Programming Language Setup

Using asdf which is installed via brew leaves.txt

```bash
asdf plugin add python 
asdf plugin add dart 
asdf plugin add golang  https://github.com/kennyp/asdf-golang.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add java 

asdf install python 3.11.0
asdf install dart 2.19.6
asdf install golang 1.22.1
asdf install nodejs 20.3.0
asdf install java corretto-21.0.2.13.1
```


#### Bat syntax

The `bat` theme requires you to run `bat cache --build` 

see: https://github.com/catppuccin/bat?tab=readme-ov-file#usage

 #### Inspired by:

- https://www.jakewiesler.com/blog/managing-dotfiles#understanding-stow 
- https://github.com/omerxx/dotfiles
- https://github.com/tylertreat/dotfiles
