stow --target ~/.config nvim

mkdir -p ~/.config/tmux
stow --target ~/.config/tmux tmux

stow --target ~/.config spaceship

mkdir -p ~/.config/alacritty
stow --target ~/.config/alacritty alacritty
curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml

