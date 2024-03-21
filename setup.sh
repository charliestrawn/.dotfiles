
if ![ -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

stow zsh

stow nvim

mkdir -p ~/.config/tmux
stow --target ~/.config/tmux tmux

stow --target ~/.config spaceship

mkdir -p ~/.config/alacritty
stow --target ~/.config/alacritty alacritty
curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml

mkdir -p ~/.conig/bat
stow --target ~/.config/bat bat

