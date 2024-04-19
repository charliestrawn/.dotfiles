
if ![ -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# goal of replacing these with stow /*
stow zsh
stow nvim
stow tmux
stow spaceship
stow alacritty
stow bat

