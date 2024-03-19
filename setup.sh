stow --target ~/.config nvim

mkdir -p ~/.config/alacritty
stow --target ~/.config/tmux tmux

stow --target ~/.config spaceship

mkdir -p ~/.config/alacritty
curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
stow --target ~/.config/alacritty alacritty
