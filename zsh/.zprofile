# macOS: /etc/zprofile runs path_helper after .zshenv, which moves the system
# dirs ahead of ours. Re-sourcing puts our PATH entries back in front.
[[ $OSTYPE == darwin* ]] && source "$HOME/.zshenv"

# added by installers
path+=(
  "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
  /Applications/Obsidian.app/Contents/MacOS
)
